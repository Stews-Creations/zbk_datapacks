# === SPAWN GATE DOOR MARKER FROM FRAME ===
# Runs as the detected glow item frame for a gate door.

# Default direction
data modify storage zombies:temp door_dir set value "south"

# Wall-mounted frame directions
execute if data entity @s {Facing:3b} run data modify storage zombies:temp door_dir set value "south"
execute if data entity @s {Facing:4b} run data modify storage zombies:temp door_dir set value "west"
execute if data entity @s {Facing:2b} run data modify storage zombies:temp door_dir set value "north"
execute if data entity @s {Facing:5b} run data modify storage zombies:temp door_dir set value "east"

# Floor/ceiling fallback: use nearest player yaw
execute if data entity @s {Facing:0b} store result score #door_spawn_yaw global run data get entity @p[distance=..50,sort=nearest] Rotation[0] 1
execute if data entity @s {Facing:1b} store result score #door_spawn_yaw global run data get entity @p[distance=..50,sort=nearest] Rotation[0] 1
execute if score #door_spawn_yaw global matches -45..45 if data entity @s {Facing:0b} run data modify storage zombies:temp door_dir set value "south"
execute if score #door_spawn_yaw global matches -45..45 if data entity @s {Facing:1b} run data modify storage zombies:temp door_dir set value "south"
execute if score #door_spawn_yaw global matches 45..135 if data entity @s {Facing:0b} run data modify storage zombies:temp door_dir set value "west"
execute if score #door_spawn_yaw global matches 45..135 if data entity @s {Facing:1b} run data modify storage zombies:temp door_dir set value "west"
execute if score #door_spawn_yaw global matches 135..180 if data entity @s {Facing:0b} run data modify storage zombies:temp door_dir set value "north"
execute if score #door_spawn_yaw global matches 135..180 if data entity @s {Facing:1b} run data modify storage zombies:temp door_dir set value "north"
execute if score #door_spawn_yaw global matches -180..-135 if data entity @s {Facing:0b} run data modify storage zombies:temp door_dir set value "north"
execute if score #door_spawn_yaw global matches -180..-135 if data entity @s {Facing:1b} run data modify storage zombies:temp door_dir set value "north"
execute if score #door_spawn_yaw global matches -135..-45 if data entity @s {Facing:0b} run data modify storage zombies:temp door_dir set value "east"
execute if score #door_spawn_yaw global matches -135..-45 if data entity @s {Facing:1b} run data modify storage zombies:temp door_dir set value "east"

# Summon marker with direction tag
execute align xyz positioned ~0.5 ~0.5 ~0.5 if data storage zombies:temp {door_dir:"south"} run summon marker ~ ~ ~ {Tags:["door","door_gate","door_south"],data:{name:1500,zones:[0]}}
execute align xyz positioned ~0.5 ~0.5 ~0.5 if data storage zombies:temp {door_dir:"west"} run summon marker ~ ~ ~ {Tags:["door","door_gate","door_west"],data:{name:1500,zones:[0]}}
execute align xyz positioned ~0.5 ~0.5 ~0.5 if data storage zombies:temp {door_dir:"north"} run summon marker ~ ~ ~ {Tags:["door","door_gate","door_north"],data:{name:1500,zones:[0]}}
execute align xyz positioned ~0.5 ~0.5 ~0.5 if data storage zombies:temp {door_dir:"east"} run summon marker ~ ~ ~ {Tags:["door","door_gate","door_east"],data:{name:1500,zones:[0]}}

particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
execute as @a[distance=..10,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[DOOR] ","color":"green"},{"text":"Gate door marker placed!","color":"gold"}]
function zombies:build_kit/util/placement/cleanup

# Reset and spawn door
function zombies:map_elements/door/initialize
