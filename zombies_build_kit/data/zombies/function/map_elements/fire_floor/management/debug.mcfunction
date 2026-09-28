# ===================================
# FIRE FLOOR DEBUG
# ===================================
# Purpose: Debug fire floor system
# Usage: /function zombies:map_elements/fire_floor/management/debug

# Check toggle state
execute if score #fire_floor fire_floor_toggle matches 0 run tellraw @s [{"text":"[Debug] Toggle State: ","color":"aqua"},{"text":"OFF (0)","color":"red"}]
execute if score #fire_floor fire_floor_toggle matches 1 run tellraw @s [{"text":"[Debug] Toggle State: ","color":"aqua"},{"text":"ON (1)","color":"green"}]
execute unless score #fire_floor fire_floor_toggle matches 0.. run tellraw @s [{"text":"[Debug] Toggle State: ","color":"aqua"},{"text":"NOT SET","color":"red"}]

# Count markers
execute store result score #marker_count fire_floor_toggle run execute if entity @e[type=marker,tag=fire_floor_marker]
tellraw @s [{"text":"[Debug] Fire Floor Markers: ","color":"aqua"},{"score":{"name":"#marker_count","objective":"fire_floor_toggle"},"color":"yellow"}]

# Show marker locations with particles
execute at @e[type=marker,tag=fire_floor_marker] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 1 force
tellraw @s [{"text":"[Debug] Showing marker locations with purple particles","color":"green"}]

# Test particle spawn directly
execute at @e[type=marker,tag=fire_floor_marker] run particle flame ~ ~0.5 ~ 0.3 0.05 0.3 0.01 10 force
tellraw @s [{"text":"[Debug] Spawning test fire particles at all markers","color":"green"}]
