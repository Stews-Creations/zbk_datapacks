# Initialize raycast from shooter
# Called from each weapon's shoot/slot_X.mcfunction

# Store data from passed storage
$scoreboard players set #gun_id stats $(id)
$scoreboard players set #damage stats $(damage)
$scoreboard players set #is_piercing stats $(is_piercing)
$scoreboard players set #spread_radius stats $(spread_radius)
$scoreboard players set #trail_spacing stats $(trail_spacing)
$scoreboard players set #is_explosive stats $(is_explosive)
$scoreboard players set #explosive_damage stats $(explosive_damage)
$scoreboard players set #explosive_radius stats $(explosive_radius)

# Read PaP tier for active weapon slot
execute if score @s active_weapon matches 0 store result score #tier stats run scoreboard players get @s tier_1
execute if score @s active_weapon matches 1 store result score #tier stats run scoreboard players get @s tier_2
execute if score @s active_weapon matches 2 store result score #tier stats run scoreboard players get @s tier_3
execute if entity @s[team=downed] if score #gun_id stats matches 5 run scoreboard players set #tier stats 0
execute if entity @s[team=downed] if score #gun_id stats matches 5 if score @s gun_1 matches 5 store result score #tier stats run scoreboard players get @s tier_1
execute if entity @s[team=downed] if score #gun_id stats matches 5 unless score @s gun_1 matches 5 if score @s gun_2 matches 5 store result score #tier stats run scoreboard players get @s tier_2
execute if entity @s[team=downed] if score #gun_id stats matches 5 unless score @s gun_1 matches 5 unless score @s gun_2 matches 5 if score @s gun_3 matches 5 store result score #tier stats run scoreboard players get @s tier_3
execute if entity @s[team=downed] if score #gun_id stats matches 7 run scoreboard players set #tier stats 0
execute if entity @s[team=downed] if score #gun_id stats matches 7 if score @s gun_1 matches 7 store result score #tier stats run scoreboard players get @s tier_1
execute if entity @s[team=downed] if score #gun_id stats matches 7 unless score @s gun_1 matches 7 if score @s gun_2 matches 7 store result score #tier stats run scoreboard players get @s tier_2
execute if entity @s[team=downed] if score #gun_id stats matches 7 unless score @s gun_1 matches 7 unless score @s gun_2 matches 7 if score @s gun_3 matches 7 store result score #tier stats run scoreboard players get @s tier_3
execute if entity @s[team=downed] if score #gun_id stats matches 7 if score #tier stats matches 2.. run scoreboard players set #tier stats 1

# Select upgraded Ray Gun impact AND splash once per shot, including downed owned slots.
execute if score #gun_id stats matches 7 if score #tier stats matches 1.. store result score #damage stats run data get storage zbk:weapons guns.ray_gun_pap.damage
execute if score #gun_id stats matches 7 if score #tier stats matches 1.. store result score #explosive_damage stats run data get storage zbk:weapons guns.ray_gun_pap.explosive_damage

# Pistol (id 5) becomes explosive when PaP'd — overrides storage default
execute if score #gun_id stats matches 5 if score #tier stats matches 1.. run scoreboard players set #is_explosive stats 1
execute if score #gun_id stats matches 5 if score #tier stats matches 1.. run scoreboard players set #explosive_damage stats 5
execute if score #gun_id stats matches 5 if score #tier stats matches 1.. run scoreboard players set #explosive_radius stats 2

# Read PaP element for active weapon slot
execute if score @s active_weapon matches 0 store result score #element stats run scoreboard players get @s element_1
execute if score @s active_weapon matches 1 store result score #element stats run scoreboard players get @s element_2
execute if score @s active_weapon matches 2 store result score #element stats run scoreboard players get @s element_3
execute if entity @s[team=downed] if score #gun_id stats matches 5 run scoreboard players set #element stats 0
execute if entity @s[team=downed] if score #gun_id stats matches 5 if score @s gun_1 matches 5 store result score #element stats run scoreboard players get @s element_1
execute if entity @s[team=downed] if score #gun_id stats matches 5 unless score @s gun_1 matches 5 if score @s gun_2 matches 5 store result score #element stats run scoreboard players get @s element_2
execute if entity @s[team=downed] if score #gun_id stats matches 5 unless score @s gun_1 matches 5 unless score @s gun_2 matches 5 if score @s gun_3 matches 5 store result score #element stats run scoreboard players get @s element_3
execute if entity @s[team=downed] if score #gun_id stats matches 7 run scoreboard players set #element stats 0
execute if score #gun_id stats matches 7 run scoreboard players set #element stats 0

# Charged electric shots stop at their first enemy; quick shots still pierce.
function zbk:dispatch/extension/combat/weapons/mechanics/raycast/start/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Set active player
execute store result score #player stats run scoreboard players get @s id

# Tag prevents shooter from being hit by their own raycast
tag @s add raycasting

# Start each shot clean, including recovery from an earlier interrupted command chain.
scoreboard players set @s raycast_distance 0
scoreboard players set #ray_limit stats 1000
execute if score #gun_id stats matches 2 run scoreboard players set #ray_limit stats 100
execute if score #gun_id stats matches 9 run scoreboard players set #ray_limit stats 100
function zbk:dispatch/extension/combat/weapons/mechanics/raycast/start/fallback_0

execute if score #gun_id stats matches 20..46 at @s anchored eyes positioned ^ ^ ^ rotated as @s run function zbk:combat/weapons/guns/bo3/combat/profile with storage zbk:bo3 profile

# Both loops return directly from their last sample; clean up once per shot.
tag @e[tag=raycast_hit] remove raycast_hit
tag @e[type=interaction,tag=menu_raycast_hit] remove menu_raycast_hit
tag @e[type=interaction,tag=menu_v2_raycast_hit] remove menu_v2_raycast_hit

# Remove raycasting tag after completion
tag @s remove raycasting

# Reset raycast distance
scoreboard players reset @s raycast_distance
