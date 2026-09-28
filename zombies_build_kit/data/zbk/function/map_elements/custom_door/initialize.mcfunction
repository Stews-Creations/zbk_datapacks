# ===================================
# CUSTOM DOORS - INITIALIZE / RESET
# ===================================
# Resets all custom door signs: restores blocks, removes purchased, recreates UI

# Process each custom_door_sign marker
execute as @e[type=marker,tag=custom_door_sign] at @s run function zbk:map_elements/custom_door/reset/reset

# Set up floating effect for eligible doors (after signs are reset/blocks restored)
function zbk:map_elements/custom_door/float/reset_emitters
