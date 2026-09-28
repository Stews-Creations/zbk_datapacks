# ===================================
# SPAWN MENU - RESET MENU MUSIC
# ===================================
# Resets Menu Music option to default state (red, original position)

# Only reset if currently hovered
execute as @e[type=text_display,tag=menu_option_music,tag=hovered,tag=!menu_music_enabled] run data modify entity @s text set value [{"text":"Menu Music: OFF","color":"red","bold":true}]
execute as @e[type=text_display,tag=menu_option_music,tag=hovered,tag=menu_music_enabled] run data modify entity @s text set value [{"text":"Menu Music: ON","color":"yellow","bold":true}]

# Move back to original position
execute as @e[type=text_display,tag=menu_option_music,tag=hovered] at @s run tp @s ^ ^ ^-0.1

# Remove hovered tag
tag @e[type=text_display,tag=menu_option_music] remove hovered
