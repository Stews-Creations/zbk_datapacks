# ===================================
# BARRIER W3 SPAWNING - SPAWN REPAIR TEXT
# ===================================
# Context: Executed as boards_spawn_w3 marker at @s

# ===== SPAWN REPAIR TEXT BASED ON DIRECTION =====
# Facing South
execute if score @s playerYaw matches -45..45 run summon text_display ~ ~-1 ~-.25 {Tags:["barrier_w3_repair_text","barrier_w3_ui","barrier_w3_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}

# Facing West
execute if score @s playerYaw matches 45..135 run summon text_display ~.25 ~-1 ~ {Tags:["barrier_w3_repair_text","barrier_w3_ui","barrier_w3_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}

# Facing North
execute if score @s playerYaw matches 135..180 run summon text_display ~ ~-1 ~.25 {Tags:["barrier_w3_repair_text","barrier_w3_ui","barrier_w3_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}
execute if score @s playerYaw matches -180..-135 run summon text_display ~ ~-1 ~.25 {Tags:["barrier_w3_repair_text","barrier_w3_ui","barrier_w3_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}

# Facing East
execute if score @s playerYaw matches -135..-45 run summon text_display ~-.25 ~-1 ~ {Tags:["barrier_w3_repair_text","barrier_w3_ui","barrier_w3_text_just_spawned"],billboard:"fixed",background:0,brightness:{block:8,sky:0},view_range:0.0f,transformation:{left_rotation:[0f,-0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.0f,1.0f,1.0f]}}

# ===== SET TEXT CONTENT =====
execute as @e[type=text_display,tag=barrier_w3_text_just_spawned,distance=..2] run data modify entity @s text set value [{"text":"Sneak to Repair","color":"gold","bold":false}]

# ===== ENABLE GLOW EFFECT =====
execute as @e[type=text_display,tag=barrier_w3_text_just_spawned,distance=..2] run data modify entity @s text_opacity set value -1b

# ===== REMOVE SPAWN TAG =====
tag @e[type=text_display,tag=barrier_w3_text_just_spawned,distance=..2] remove barrier_w3_text_just_spawned
