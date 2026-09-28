# ===================================
# DISCO BALL - ROTATION
# ===================================
# Rotates the disco ball on the Y axis using interpolation

# Initialize new disco balls with interpolation settings
execute as @e[type=item_display,tag=disco_ball,tag=!disco_init] run data modify entity @s interpolation_duration set value 1
execute as @e[type=item_display,tag=disco_ball,tag=!disco_init] run tag @s add disco_init

# Update rotation every tick for smooth continuous rotation
execute as @e[type=item_display,tag=disco_ball] at @s run tp @s ~ ~ ~ ~0.5 ~
