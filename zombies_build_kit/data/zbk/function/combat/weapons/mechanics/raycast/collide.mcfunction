execute if data entity @s {Health:0.0f} run return 0
# Combat decoys and turned zombies skip all damage/effect processing.
execute if entity @s[tag=combat_ignore] run return fail
execute if entity @s[tag=immune_guns] run return fail
execute if entity @s[tag=monkey_bomb_decoy] run return fail
execute if entity @s[tag=solo_down_decoy] run return fail
execute if entity @s[tag=turned_zombie] run return fail

# Stop walking immediately on a full-charge direct hit, respecting elemental immunity.
function zbk:combat/weapons/events/extension/mechanics/raycast/collide/before_core_damage
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Tag mob so it knows it was hit by this raycast loop
tag @s add raycast_hit

# --- Handle hit points ---
execute unless entity @s[tag=bo3_shell_hit] as @a if score @s id = #player stats run function zbk:player/points/add_hit_points

# --- Element effects (Turned, Dead Wire, etc.) ---
# If an element handler consumes the bullet (conversion etc.), skip remaining damage.
scoreboard players set #element_handled stats 0
execute unless entity @s[tag=bo3_shell_hit] store result score #element_handled stats run function zbk:combat/weapons/pack_a_punch/elements/dispatch
execute if score #element_handled stats matches 1 run return 0

# --- Handle Damage ---

# Get initial mob health; keep an independent snapshot across splash victims.
execute store result score #direct_explosive_before stats run data get entity @s Health 100
execute store result score #health stats run data get entity @s Health
# Subtract large number if insta kill (ensures they die)
execute if score global insta_kill matches 1 run execute store result entity @s Health float 1.0 run scoreboard players operation #health stats -= #insta_kill stats

# Double legacy damage for PaP I or II; Ray Gun selects its profile once per shot.
execute unless score #gun_id stats matches 20..46 unless score #gun_id stats matches 7 run execute if score #tier stats matches 1.. run scoreboard players operation #damage stats *= #2 stats

# Headshot bonus damage (applied in addition to core damage on line 26 = 2x total)
execute unless score #gun_id stats matches 20..46 unless score #is_explosive stats matches 1 if entity @s[distance=1.65..] run execute store result entity @s Health float 1.0 run scoreboard players operation #health stats -= #damage stats
# Headshot effect
execute if entity @s[distance=1.65..] run particle minecraft:block{block_state:{Name:"minecraft:redstone_block"}} ~ ~ ~ 0.5 0.5 0.5 2 30
# Tag for headshot kill tracking
execute if entity @s[distance=1.65..] run tag @s add headshot_hit

# The base pack damage
execute store result score #health stats run data get entity @s Health
execute unless score #gun_id stats matches 20..46 unless score #is_explosive stats matches 1 run execute store result entity @s Health float 1.0 run scoreboard players operation #health stats -= #damage stats
execute unless score #gun_id stats matches 20..46 if score #is_explosive stats matches 1 run function zbk:combat/weapons/effects/explosive/damage/direct_damage

execute if score #gun_id stats matches 20..46 run function zbk:combat/weapons/guns/bo3/combat/damage

# Bodyshot effect
execute if entity @s[distance=1..1.65] run particle minecraft:block{block_state:{Name:"minecraft:redstone_block"}} ~ ~ ~ 0.5 0.5 0.5 2 30

# Leg shot effect
execute if entity @s[distance=..1] run particle minecraft:block{block_state:{Name:"minecraft:redstone_block"}} ~ ~ ~ 0.5 0.5 0.5 2 30

# --- Handle burn effect ---

# Burn for flamethrower
execute as @s run execute if score #gun_id stats matches 2 run effect give @s minecraft:wither 2 2 true

# --- Handle Explosive Weapons ---

# Tag direct hit entity and mark if leg shot for explosion behavior
execute if score #is_explosive stats matches 1 run tag @s add explosion_direct_hit
execute unless score #gun_id stats matches 20..46 if score #is_explosive stats matches 1 if entity @s[distance=..1] as @a if score @s id = #player stats run tag @s add explosion_leg_shot

# Trigger explosion at hit position (splash damage or crawler conversion based on hit height)
execute if score #is_explosive stats matches 1 unless score #gun_id stats matches 20..46 run function zbk:combat/weapons/effects/explosive/entity_explosion
execute if score #is_explosive stats matches 1 if score #gun_id stats matches 20..46 run function zbk:combat/weapons/guns/bo3/combat/explosion
function zbk:combat/weapons/events/extension/mechanics/raycast/collide/after_core_explosion
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score #is_explosive stats matches 1 if score #gun_id stats matches 5 run playsound minecraft:entity.generic.explode master @a[distance=..20] ~ ~ ~ 0.6 1.4

# --- Handle piercing ---

# If not piercing round, set distance to max
execute as @a if score @s id = #player stats if score #is_piercing stats matches 0 run scoreboard players set @s raycast_distance 10001

# --- Ensure the pigman/wolf stay mad  ---
# Store UUID of the player whose id equals #player stats (AngryAt is piglin/wolf-specific)
# Exclude turned zombies; their AngryAt is managed by turned/on_tick to target other zombies
execute if entity @s[type=zombified_piglin,tag=!turned_zombie] run execute as @a if score @s id = #player stats run data modify storage zbk:temp target_uuid set from entity @s UUID
execute if entity @s[type=zombified_piglin,tag=!turned_zombie] run data modify entity @s AngryAt set from storage zbk:temp target_uuid
execute if entity @s[type=wolf] run execute as @a if score @s id = #player stats run data modify storage zbk:temp target_uuid set from entity @s UUID
execute if entity @s[type=wolf] run data modify entity @s AngryAt set from storage zbk:temp target_uuid

# Give points for kill
execute store result score #health stats run data get entity @s Health 100
execute if score #health stats matches ..0 if entity @s[tag=crawler_ai] run execute as @a if score @s id = #player stats run function zbk:combat/enemies/events/voice_event_crawler_kill
execute if score #health stats matches ..0 unless entity @s[tag=crawler_ai] unless entity @s[tag=headshot_hit] run execute as @a if score @s id = #player stats run function zbk:combat/enemies/events/voice_event_kill
execute if score #health stats matches ..0 run execute as @a if score @s id = #player stats run function zbk:player/points/add_kill_points

# Remove paired crawler display on kill
execute if score #health stats matches ..0 if entity @s[tag=crawler_ai] run function zbk:behavior/crawler/remove_paired_display
function zbk:combat/weapons/events/extension/mechanics/raycast/collide/before_headshot_tracking
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Track headshot kills
execute if score #health stats matches ..0 if entity @s[tag=headshot_hit] as @a if score @s id = #player stats run scoreboard players add @s stat_headshots 1
execute if score #health stats matches ..0 unless entity @s[tag=crawler_ai] if entity @s[tag=headshot_hit] as @a if score @s id = #player stats run function zbk:combat/enemies/events/voice_event_headshot
tag @s remove headshot_hit

execute if score #health stats matches ..0 run scoreboard players operation #map_killer temp = #player stats
execute if score #health stats matches ..0 run execute at @s run function zbk:combat/enemies/lifecycle/killed
execute if score #health stats matches ..0 run execute if entity @s[type=zombified_piglin] run loot spawn ~ ~ ~ loot entities/zombified_piglin
execute if score #health stats matches ..0 run execute if entity @s[type=wolf] run loot spawn ~ ~ ~ loot entities/wolf

# Conversion is last: the adult's removal must not award a second kill or soul.
# Direct targets already took impact damage; never apply another splash hit here.
execute unless score #gun_id stats matches 20..46 if score #is_explosive stats matches 1 if entity @s[distance=..1,type=zombified_piglin,nbt={IsBaby:0b}] if score #health stats matches 1.. run function zbk:combat/weapons/effects/explosive/damage/direct_survivor
