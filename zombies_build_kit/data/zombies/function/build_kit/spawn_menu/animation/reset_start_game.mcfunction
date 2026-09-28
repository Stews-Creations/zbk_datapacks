# ===================================
# SPAWN MENU - RESET START GAME
# ===================================
# Resets Start Game option to default state (red, original position)

# Only reset if currently hovered
execute as @e[type=text_display,tag=menu_option_start,tag=hovered] run data modify entity @s text set value [{"text":"Start Game","color":"red","bold":true}]

# Move back to original position
execute as @e[type=text_display,tag=menu_option_start,tag=hovered] at @s run tp @s ^ ^ ^-0.1

# Remove hovered tag
tag @e[type=text_display,tag=menu_option_start] remove hovered
