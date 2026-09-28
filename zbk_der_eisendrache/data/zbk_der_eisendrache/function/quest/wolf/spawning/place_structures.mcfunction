# Place wolf painting structures at painting marker locations with appropriate rotations
# Wolf painting structures are saved facing EAST, so rotations are inverted from standard
# Direction is determined by the spawn_location marker, not the painting marker

# INVERTED ROTATION MAPPING (for east-facing structures):
# South → clockwise_90 with offset ~1 ~ ~
# West → 180 with offset ~ ~ ~1
# North → counterclockwise_90 with offset ~-1 ~ ~
# East → none with offset ~ ~ ~-1

# NOTE: If you get "Block-attached entity at invalid position" errors,
# ensure your structure templates include solid blocks for item frames to attach to

# ===== WOLF PAINTING 1 =====
# Place painting 1 at whichever location it was teleported to
# South facing locations
execute as @e[type=marker,tag=wolf_painting_1] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_south,distance=..1] run place template minecraft:zombies/wolf_painting_1 ~1 ~ ~ clockwise_90
# West facing locations
execute as @e[type=marker,tag=wolf_painting_1] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_west,distance=..1] run place template minecraft:zombies/wolf_painting_1 ~ ~ ~1 180
# North facing locations
execute as @e[type=marker,tag=wolf_painting_1] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_north,distance=..1] run place template minecraft:zombies/wolf_painting_1 ~-1 ~ ~ counterclockwise_90
# East facing locations
execute as @e[type=marker,tag=wolf_painting_1] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_east,distance=..1] run place template minecraft:zombies/wolf_painting_1 ~ ~ ~-1 none

# ===== WOLF PAINTING 2 =====
# Place painting 2 at whichever location it was teleported to
# South facing locations
execute as @e[type=marker,tag=wolf_painting_2] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_south,distance=..1] run place template minecraft:zombies/wolf_painting_2 ~1 ~ ~ clockwise_90
# West facing locations
execute as @e[type=marker,tag=wolf_painting_2] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_west,distance=..1] run place template minecraft:zombies/wolf_painting_2 ~ ~ ~1 180
# North facing locations
execute as @e[type=marker,tag=wolf_painting_2] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_north,distance=..1] run place template minecraft:zombies/wolf_painting_2 ~-1 ~ ~ counterclockwise_90
# East facing locations
execute as @e[type=marker,tag=wolf_painting_2] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_east,distance=..1] run place template minecraft:zombies/wolf_painting_2 ~ ~ ~-1 none

# ===== WOLF PAINTING 3 =====
# Place painting 3 at whichever location it was teleported to
# South facing locations
execute as @e[type=marker,tag=wolf_painting_3] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_south,distance=..1] run place template minecraft:zombies/wolf_painting_3 ~1 ~ ~ clockwise_90
# West facing locations
execute as @e[type=marker,tag=wolf_painting_3] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_west,distance=..1] run place template minecraft:zombies/wolf_painting_3 ~ ~ ~1 180
# North facing locations
execute as @e[type=marker,tag=wolf_painting_3] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_north,distance=..1] run place template minecraft:zombies/wolf_painting_3 ~-1 ~ ~ counterclockwise_90
# East facing locations
execute as @e[type=marker,tag=wolf_painting_3] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_east,distance=..1] run place template minecraft:zombies/wolf_painting_3 ~ ~ ~-1 none

# ===== WOLF PAINTING 4 =====
# Place painting 4 at whichever location it was teleported to
# South facing locations
execute as @e[type=marker,tag=wolf_painting_4] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_south,distance=..1] run place template minecraft:zombies/wolf_painting_4 ~1 ~ ~ clockwise_90
# West facing locations
execute as @e[type=marker,tag=wolf_painting_4] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_west,distance=..1] run place template minecraft:zombies/wolf_painting_4 ~ ~ ~1 180
# North facing locations
execute as @e[type=marker,tag=wolf_painting_4] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_north,distance=..1] run place template minecraft:zombies/wolf_painting_4 ~-1 ~ ~ counterclockwise_90
# East facing locations
execute as @e[type=marker,tag=wolf_painting_4] at @s if entity @e[type=marker,tag=wolf_spawn_location,tag=wolf_east,distance=..1] run place template minecraft:zombies/wolf_painting_4 ~ ~ ~-1 none

# Lock the spawned frames so players cannot remove or rotate the painting items.
execute as @e[type=marker,tag=wolf_painting] at @s as @e[type=minecraft:item_frame,distance=..5] run data merge entity @s {Fixed:1b}
execute as @e[type=marker,tag=wolf_painting] at @s as @e[type=minecraft:glow_item_frame,distance=..5] run data merge entity @s {Fixed:1b}
