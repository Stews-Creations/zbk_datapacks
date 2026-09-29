# ===================================
# BARRIER SPAWNING - SPAWN
# ===================================
# Purpose: Handle barrier marker placement and spawn barrier structure with directional placement
#
# Called when: Silverfish spawn egg with name "Barrier Marker" is placed
# ===================================

# ===== STORE PLAYER YAW =====
# For each Barrier Marker, store player yaw into scoreboard
execute as @e[type=minecraft:silverfish,name="Barrier Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# ===== PLACE BARRIER STRUCTURE (DIRECTIONAL) =====
# Facing South (yaw between -45° and 45°)
execute as @e[type=minecraft:silverfish,name="Barrier Marker"] at @s if score @p playerYaw matches -45..45 run place template zbk:barriers/barrier ~-1 ~ ~1 counterclockwise_90

# Facing West (yaw between 45° and 135°)
execute as @e[type=minecraft:silverfish,name="Barrier Marker"] at @s if score @p playerYaw matches 45..135 run place template zbk:barriers/barrier ~-1 ~ ~-1 none

# Facing North (yaw between 135..180 or -180..-135)
execute as @e[type=minecraft:silverfish,name="Barrier Marker"] at @s if score @p playerYaw matches 135..180 run place template zbk:barriers/barrier ~1 ~ ~-1 clockwise_90
execute as @e[type=minecraft:silverfish,name="Barrier Marker"] at @s if score @p playerYaw matches -180..-135 run place template zbk:barriers/barrier ~1 ~ ~-1 clockwise_90

# Facing East (yaw between -135..-45)
execute as @e[type=minecraft:silverfish,name="Barrier Marker"] at @s if score @p playerYaw matches -135..-45 run place template zbk:barriers/barrier ~1 ~ ~1 180

# ===== CREATE BARRIER MARKER =====
# Summon marker entity at spawn egg location
execute as @e[type=minecraft:silverfish,name="Barrier Marker"] at @s run summon marker ~ ~ ~ {Tags:["barrier","barrier_new"]}

# ===== STORE ROTATION IN MARKER =====
# Store the nearest player's yaw in the barrier marker for later use
execute as @e[type=marker,tag=barrier_new] at @s run execute as @p[distance=..50,sort=nearest] store result score @e[type=marker,tag=barrier_new,limit=1,sort=nearest] playerYaw run data get entity @s Rotation[0] 1

# ===== INITIALIZE BARRIER STATE =====
# Set initial state (0 = intact, not damaged)
scoreboard players set @e[type=marker,tag=barrier_new] barrier_state 0

# Set break timer to -1 (inactive)
scoreboard players set @e[type=marker,tag=barrier_new] barrier_break_timer -1

# ===== CLEAN UP STALE ENTITIES FROM TEMPLATE =====
# Structure template contains old board entities - kill them before spawning fresh boards
execute as @e[type=marker,tag=barrier_new] at @s run kill @e[type=item_display,tag=barrier_passenger,distance=..3]
execute as @e[type=marker,tag=barrier_new] at @s run kill @e[type=item_display,tag=barrier_boards,distance=..3]
execute as @e[type=marker,tag=barrier_new] at @s run kill @e[type=text_display,tag=barrier_repair_text,distance=..3]

# ===== STORE DIRECTION IN boards_spawn MARKER =====
# Copy playerYaw from newly placed barrier marker to boards_spawn marker
execute as @e[type=marker,tag=barrier_new] at @s run scoreboard players operation @e[type=marker,tag=boards_spawn,distance=..3,limit=1,sort=nearest] playerYaw = @s playerYaw

# ===== REMOVE boards_spawned TAG FROM NEW BARRIERS =====
# Structure templates might have boards_spawned tag pre-set, so remove it for fresh placement
execute as @e[type=marker,tag=barrier_new] at @s run tag @e[type=marker,tag=boards_spawn,distance=..3] remove boards_spawned

# ===== REMOVE NEW TAG =====
# Remove initialization tag
tag @e[type=marker,tag=barrier_new] remove barrier_new

# ===== SPAWN BARRIER BOARDS =====
# Detect boards_spawn markers near base barrier markers and spawn directional boards
execute as @e[type=marker,tag=boards_spawn,tag=!boards_spawned] at @s run function zbk:map_elements/barrier/spawning/spawn_boards

# ===== CLEAN UP SPAWN EGG =====
# Remove the spawn egg entity
kill @e[type=minecraft:silverfish,name="Barrier Marker"]
