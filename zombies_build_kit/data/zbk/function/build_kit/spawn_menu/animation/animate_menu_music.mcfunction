# ===================================
# SPAWN MENU - ANIMATE MENU MUSIC
# ===================================
# Animates the Menu Music option when hovered
# Changes color to green and moves forward

# Only animate if not already hovered (prevents sound spam)
execute as @e[type=text_display,tag=menu_option_music,tag=!hovered] at @s run playsound minecraft:block.note_block.hat master @a[distance=..10] ~ ~ ~ 0.5 2

# Change text color to green and keep current state (ON/OFF)
execute as @e[type=text_display,tag=menu_option_music,tag=!menu_music_enabled] run data modify entity @s text set value [{"text":"Menu Music: OFF","color":"green","bold":true}]
execute as @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled] run data modify entity @s text set value [{"text":"Menu Music: ON","color":"green","bold":true}]

# Move forward by 0.1 blocks (towards player)
execute as @e[type=text_display,tag=menu_option_music,tag=!hovered] at @s run tp @s ^ ^ ^0.1

# Tag as hovered to track state
tag @e[type=text_display,tag=menu_option_music] add hovered
