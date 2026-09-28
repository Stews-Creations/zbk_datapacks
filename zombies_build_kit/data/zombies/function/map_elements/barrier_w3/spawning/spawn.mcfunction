# ===================================
# BARRIER W3 SPAWNING - SPAWN
# ===================================
# Purpose: Handle wide barrier marker placement and spawn barrier structure
# Called when: Silverfish spawn egg with name "Barrier Marker (3-Wide)" is placed

# ===== STORE PLAYER YAW =====
execute as @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# ===== PLACE BARRIER STRUCTURE (DIRECTIONAL) =====
# Facing South (yaw between -45 and 45)
execute as @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"] at @s if score @p playerYaw matches -45..45 run place template minecraft:zombies/barrier_width3 ~-1 ~ ~1 counterclockwise_90

# Facing West (yaw between 45 and 135)
execute as @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"] at @s if score @p playerYaw matches 45..135 run place template minecraft:zombies/barrier_width3 ~-1 ~ ~-1 none

# Facing North (yaw between 135..180 or -180..-135)
execute as @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"] at @s if score @p playerYaw matches 135..180 run place template minecraft:zombies/barrier_width3 ~1 ~ ~-1 clockwise_90
execute as @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"] at @s if score @p playerYaw matches -180..-135 run place template minecraft:zombies/barrier_width3 ~1 ~ ~-1 clockwise_90

# Facing East (yaw between -135..-45)
execute as @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"] at @s if score @p playerYaw matches -135..-45 run place template minecraft:zombies/barrier_width3 ~1 ~ ~1 180

# ===== CREATE BARRIER MARKER =====
execute as @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"] at @s run summon marker ~ ~ ~ {Tags:["barrier_w3","barrier_w3_new"]}

# ===== STORE ROTATION IN MARKER =====
execute as @e[type=marker,tag=barrier_w3_new] at @s run execute as @p[distance=..50,sort=nearest] store result score @e[type=marker,tag=barrier_w3_new,limit=1,sort=nearest] playerYaw run data get entity @s Rotation[0] 1

# ===== INITIALIZE BARRIER STATE =====
scoreboard players set @e[type=marker,tag=barrier_w3_new] bw3_state 0
scoreboard players set @e[type=marker,tag=barrier_w3_new] bw3_break_timer -1

# ===== CLEAN UP STALE ENTITIES FROM TEMPLATE =====
execute as @e[type=marker,tag=barrier_w3_new] at @s run kill @e[type=item_display,tag=barrier_w3_passenger,distance=..3]
execute as @e[type=marker,tag=barrier_w3_new] at @s run kill @e[type=item_display,tag=barrier_w3_boards,distance=..3]
execute as @e[type=marker,tag=barrier_w3_new] at @s run kill @e[type=text_display,tag=barrier_w3_repair_text,distance=..3]

# ===== TAG BOARDS_SPAWN MARKER AS W3 =====
# The structure contains a boards_spawn marker - tag it as boards_spawn_w3 to distinguish from regular barriers
execute as @e[type=marker,tag=barrier_w3_new] at @s run tag @e[type=marker,tag=boards_spawn,distance=..3,limit=1,sort=nearest] add boards_spawn_w3

# ===== STORE DIRECTION IN boards_spawn MARKER =====
execute as @e[type=marker,tag=barrier_w3_new] at @s run scoreboard players operation @e[type=marker,tag=boards_spawn_w3,distance=..3,limit=1,sort=nearest] playerYaw = @s playerYaw

# ===== REMOVE boards_spawned TAG =====
execute as @e[type=marker,tag=barrier_w3_new] at @s run tag @e[type=marker,tag=boards_spawn_w3,distance=..3] remove boards_spawned

# ===== REMOVE NEW TAG =====
tag @e[type=marker,tag=barrier_w3_new] remove barrier_w3_new

# ===== SPAWN BARRIER BOARDS =====
execute as @e[type=marker,tag=boards_spawn_w3,tag=!boards_spawned] at @s run function zombies:map_elements/barrier_w3/spawning/spawn_boards

# ===== CLEAN UP SPAWN EGG =====
kill @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"]
