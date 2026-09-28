# === GRENADE EXPLOSION ===
# Triggered when grenade hits ground

# Tag to prevent multiple explosions
tag @s add exploded

# Visual effects
particle minecraft:explosion ~ ~ ~ 2 2 2 0.1 20 force
# Shared callers such as Monkey Bombs and Trip Mines keep their own existing blast sound.
execute if entity @s[tag=hand_grenade] run playsound zombies:grenade.explode hostile @a ~ ~ ~ 2 1
execute unless entity @s[tag=hand_grenade] run playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 1

# Check for disco interaction hit (within 1 block)
function zbk:dispatch/extension/combat/weapons/grenade/explode/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Snapshot this marker owner before visiting players or mobs.
execute store result score #shooter_id stats run data get entity @s data.thrower_id

# Handle players in radius (only thrower takes damage - no friendly fire)
execute as @a[distance=..5] at @s run function zombies:combat/weapons/grenade/damage/handle_player

# Use the shared damage/survival path with this marker owner.
scoreboard players set #explosive_damage stats 50
scoreboard players set #blast_raygun stats 0
scoreboard players set #blast_crawlers stats 1
scoreboard players set #blast_kill_bonus stats 40
execute as @e[type=!#zombies:not_mob,type=!player,distance=..5,tag=!combat_ignore,tag=!immune_explosives,tag=!turned_zombie,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] at @s run function zombies:combat/weapons/effects/explosive/apply_splash_damage

# Trigger explosive barrels in blast radius (instant explode)
execute as @e[type=marker,tag=explosive_barrel,tag=!explosive_barrel_exploded,distance=..7] at @s run function zombies:map_elements/explosive_barrel/gameplay/explode

# Kill the item display (matched by grenade_id) and marker
scoreboard players operation #current_grenade_id grenade_id = @s grenade_id
execute as @e[type=item_display,tag=grenade_display] if score @s grenade_id = #current_grenade_id grenade_id run kill @s
kill @s
