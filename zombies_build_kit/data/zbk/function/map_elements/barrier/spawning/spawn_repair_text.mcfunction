# Reconstruction must initialize prompt visibility from the owning barrier state.
# Transition-only updates rely on newly created displays starting with the correct visibility.

# ===================================
# BARRIER SPAWNING - SPAWN REPAIR TEXT
# ===================================
# Purpose: Spawn directional repair prompt text display
#
# Context: Executed as boards_spawn marker at @s
# Position: 0.5 blocks below marker
# ===================================

# ===== SPAWN REPAIR TEXT BASED ON DIRECTION =====
# Facing South (yaw between -45° and 45°) - Move 1 block forward (positive Z)
execute if score @s playerYaw matches -45..45 run summon text_display ~ ~-1 ~-.25 {Tags:["barrier_repair_text","barrier_ui","barrier_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}

# Facing West (yaw between 45° and 135°) - Move 1 block forward (negative X)
execute if score @s playerYaw matches 45..135 run summon text_display ~.25 ~-1 ~ {Tags:["barrier_repair_text","barrier_ui","barrier_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}

# Facing North (yaw between 135..180 or -180..-135) - Move 1 block forward (negative Z)
execute if score @s playerYaw matches 135..180 run summon text_display ~ ~-1 ~.25 {Tags:["barrier_repair_text","barrier_ui","barrier_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}
execute if score @s playerYaw matches -180..-135 run summon text_display ~ ~-1 ~.25 {Tags:["barrier_repair_text","barrier_ui","barrier_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}

# Facing East (yaw between -135..-45) - Move 1 block forward (positive X)
execute if score @s playerYaw matches -135..-45 run summon text_display ~-.25 ~-1 ~ {Tags:["barrier_repair_text","barrier_ui","barrier_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,-0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}

# ===== SET TEXT CONTENT =====
# Set repair prompt text (JSON value passed directly, no outer quotes)
execute as @e[type=text_display,tag=barrier_text_just_spawned,distance=..2] run data modify entity @s text set value [{"text":"Sneak to Repair","color":"gold","bold":false}]

# ===== ENABLE GLOW EFFECT =====
execute as @e[type=text_display,tag=barrier_text_just_spawned,distance=..2] run data modify entity @s text_opacity set value -1b

# ===== REMOVE SPAWN TAG =====
tag @e[type=text_display,tag=barrier_text_just_spawned,distance=..2] remove barrier_text_just_spawned

# Reconstructed prompts reflect the owning barrier, including damaged saved barriers.
execute as @e[type=marker,tag=barrier,distance=..3,limit=1,sort=nearest] at @s run function zbk:map_elements/barrier/management/update_repair_text
