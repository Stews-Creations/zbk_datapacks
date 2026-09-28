# === SPAWN CUSTOM DOOR CORNER 1 FROM FRAME ===
# Runs as the detected glow item frame for corner 1.

# Determine direction from frame Facing data (wall-mounted) or fallback to player yaw (floor/ceiling)
data modify storage zombies:temp cd_spawn.type set value "1"
data modify storage zombies:temp cd_spawn.type_tag set value "custom_door_1"
data modify storage zombies:temp cd_spawn.dir set value "cd_south"

# Wall-mounted frame directions
execute if data entity @s {Facing:3b} run data modify storage zombies:temp cd_spawn.dir set value "cd_south"
execute if data entity @s {Facing:4b} run data modify storage zombies:temp cd_spawn.dir set value "cd_west"
execute if data entity @s {Facing:2b} run data modify storage zombies:temp cd_spawn.dir set value "cd_north"
execute if data entity @s {Facing:5b} run data modify storage zombies:temp cd_spawn.dir set value "cd_east"

# Floor/ceiling fallback: use nearest player yaw
execute if data entity @s {Facing:0b} store result score #cd_spawn_yaw global run data get entity @p[distance=..50,sort=nearest] Rotation[0] 1
execute if data entity @s {Facing:1b} store result score #cd_spawn_yaw global run data get entity @p[distance=..50,sort=nearest] Rotation[0] 1
execute if score #cd_spawn_yaw global matches -45..45 if data entity @s {Facing:0b} run data modify storage zombies:temp cd_spawn.dir set value "cd_south"
execute if score #cd_spawn_yaw global matches -45..45 if data entity @s {Facing:1b} run data modify storage zombies:temp cd_spawn.dir set value "cd_south"
execute if score #cd_spawn_yaw global matches 45..135 if data entity @s {Facing:0b} run data modify storage zombies:temp cd_spawn.dir set value "cd_west"
execute if score #cd_spawn_yaw global matches 45..135 if data entity @s {Facing:1b} run data modify storage zombies:temp cd_spawn.dir set value "cd_west"
execute if score #cd_spawn_yaw global matches 135..180 if data entity @s {Facing:0b} run data modify storage zombies:temp cd_spawn.dir set value "cd_north"
execute if score #cd_spawn_yaw global matches 135..180 if data entity @s {Facing:1b} run data modify storage zombies:temp cd_spawn.dir set value "cd_north"
execute if score #cd_spawn_yaw global matches -180..-135 if data entity @s {Facing:0b} run data modify storage zombies:temp cd_spawn.dir set value "cd_north"
execute if score #cd_spawn_yaw global matches -180..-135 if data entity @s {Facing:1b} run data modify storage zombies:temp cd_spawn.dir set value "cd_north"
execute if score #cd_spawn_yaw global matches -135..-45 if data entity @s {Facing:0b} run data modify storage zombies:temp cd_spawn.dir set value "cd_east"
execute if score #cd_spawn_yaw global matches -135..-45 if data entity @s {Facing:1b} run data modify storage zombies:temp cd_spawn.dir set value "cd_east"

# Place marker at center of block the frame is placed ON (offset into attached block)
execute if data entity @s {Facing:0b} positioned ~ ~1 ~ align xyz run function zombies:map_elements/custom_door/spawning/place_corner_macro with storage zombies:temp cd_spawn
execute if data entity @s {Facing:1b} positioned ~ ~-1 ~ align xyz run function zombies:map_elements/custom_door/spawning/place_corner_macro with storage zombies:temp cd_spawn
execute if data entity @s {Facing:2b} positioned ~ ~ ~1 align xyz run function zombies:map_elements/custom_door/spawning/place_corner_macro with storage zombies:temp cd_spawn
execute if data entity @s {Facing:3b} positioned ~ ~ ~-1 align xyz run function zombies:map_elements/custom_door/spawning/place_corner_macro with storage zombies:temp cd_spawn
execute if data entity @s {Facing:4b} positioned ~1 ~ ~ align xyz run function zombies:map_elements/custom_door/spawning/place_corner_macro with storage zombies:temp cd_spawn
execute if data entity @s {Facing:5b} positioned ~-1 ~ ~ align xyz run function zombies:map_elements/custom_door/spawning/place_corner_macro with storage zombies:temp cd_spawn

particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
execute as @a[distance=..10,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[CUSTOM DOOR] ","color":"green"},{"text":"Corner 1 placed!","color":"gold"}]
function zombies:build_kit/util/placement/cleanup
