# Spawn wolf painting location marker when egg is placed
# Detects wolf spawn egg with custom name and creates permanent marker with directional data

# Store player yaw (rotation) to determine facing direction
execute as @e[type=minecraft:wolf,name="Wolf Painting Location"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Spawn marker at egg location based on player facing direction
# South (-45 to 45 degrees)
execute as @e[type=minecraft:wolf,name="Wolf Painting Location"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["wolf_painting_marker","wolf_spawn_location","wolf_south"]}

# West (45 to 135 degrees)
execute as @e[type=minecraft:wolf,name="Wolf Painting Location"] at @s if score @p playerYaw matches 45..135 run summon marker ~ ~ ~ {Tags:["wolf_painting_marker","wolf_spawn_location","wolf_west"]}

# North (135 to 180 or -180 to -135 degrees)
execute as @e[type=minecraft:wolf,name="Wolf Painting Location"] at @s if score @p playerYaw matches 135..180 run summon marker ~ ~ ~ {Tags:["wolf_painting_marker","wolf_spawn_location","wolf_north"]}
execute as @e[type=minecraft:wolf,name="Wolf Painting Location"] at @s if score @p playerYaw matches -180..-135 run summon marker ~ ~ ~ {Tags:["wolf_painting_marker","wolf_spawn_location","wolf_north"]}

# East (-135 to -45 degrees)
execute as @e[type=minecraft:wolf,name="Wolf Painting Location"] at @s if score @p playerYaw matches -135..-45 run summon marker ~ ~ ~ {Tags:["wolf_painting_marker","wolf_spawn_location","wolf_east"]}

# Visual feedback
execute as @e[type=minecraft:wolf,name="Wolf Painting Location"] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:1.5} ~ ~1 ~ 0.3 0.5 0.3 0 20 force

# Cleanup the wolf entity
kill @e[type=minecraft:wolf,name="Wolf Painting Location"]
