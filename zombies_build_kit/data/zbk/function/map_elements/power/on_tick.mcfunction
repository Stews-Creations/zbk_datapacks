# ===================================
# POWER SUBMODULE - TICK
# ===================================
# Runs every game tick for power system

# ===== SPAWN EGG DETECTION =====
# Detect and process placement of power spawn egg entity (bat marker)
execute if entity @e[type=minecraft:bat,name="Power Switch"] run function zbk:map_elements/power/management/spawn

# ===== POWER SYSTEM =====
# Check for lever activation when power is off
execute if score #power power matches 0 as @e[type=marker,tag=power_marker] at @s if block ~ ~ ~ minecraft:lever[powered=true] run function zbk:map_elements/power/management/on

# Display power-on particle effects
execute if score #power power matches 1 run function zbk:map_elements/power/effects/particles

# Keep lever in correct state
function zbk:map_elements/power/management/place_lever
