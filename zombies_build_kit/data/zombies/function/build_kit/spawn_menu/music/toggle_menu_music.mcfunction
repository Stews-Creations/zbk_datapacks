# ===================================
# SPAWN MENU - TOGGLE MENU MUSIC
# ===================================
# Toggles menu music on/off

# Toggle the music state (use temp tag to avoid issues)
execute as @e[type=text_display,tag=menu_option_music,tag=!menu_music_enabled] run tag @s add turn_on
execute as @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled,tag=!turn_on] run tag @s remove menu_music_enabled
execute as @e[type=text_display,tag=menu_option_music,tag=turn_on] run tag @s add menu_music_enabled
tag @e[type=text_display,tag=menu_option_music] remove turn_on

# Update display text based on new state
execute as @e[type=text_display,tag=menu_option_music,tag=!menu_music_enabled] run data modify entity @s text set value [{"text":"Menu Music: OFF","color":"red","bold":true}]
execute as @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled] run data modify entity @s text set value [{"text":"Menu Music: ON","color":"yellow","bold":true}]

# Stop music and reset timer if disabled
execute unless entity @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled,limit=1] run function zombies:sounds/play/music_menu_stop
execute unless entity @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled,limit=1] run scoreboard players set #menu_music_timer global 0

# Start music immediately if enabled
execute if entity @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled,limit=1] as @e[type=text_display,tag=menu_title,limit=1] at @s run function zombies:sounds/play/music_menu
execute if entity @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled,limit=1] run scoreboard players set #menu_music_timer global 0

# Feedback message
execute if entity @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled,limit=1] run tellraw @s [{"text":"[Menu] ","color":"aqua"},{"text":"Menu music enabled","color":"green"}]
execute unless entity @e[type=text_display,tag=menu_option_music,tag=menu_music_enabled,limit=1] run tellraw @s [{"text":"[Menu] ","color":"aqua"},{"text":"Menu music disabled","color":"gray"}]
