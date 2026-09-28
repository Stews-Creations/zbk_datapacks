# ===================================
# SPAWN MENU - DETECT HOVER
# ===================================
# Main hover detection dispatcher
# Called every tick from build_kit/on_tick.mcfunction
# Uses a single unified raycast — only one option can be highlighted at a time

# Clear being_looked_at from previous tick
tag @e[type=text_display,tag=spawn_menu] remove being_looked_at

# Only run if a player is within 10 blocks of the menu title
execute as @e[type=text_display,tag=menu_title,limit=1] at @s unless entity @a[distance=..10] run return fail

# Reset raycast distance
scoreboard players set #menu_raycast_distance global 0

# Run unified raycast from nearest player's eyes — stops at first menu interaction hit
execute as @e[type=text_display,tag=menu_title,limit=1] at @s as @a[distance=..10,limit=1,sort=nearest] at @s anchored eyes run function zombies:build_kit/spawn_menu/raycast/raycast_menu

# Animate/reset each option based on raycast result
execute as @e[type=text_display,tag=menu_option_start] at @s run function zombies:build_kit/spawn_menu/hover/check_hover_start
execute as @e[type=text_display,tag=menu_option_skip_cutscene] at @s run function zombies:build_kit/spawn_menu/hover/check_hover_skip_cutscene
execute as @e[type=text_display,tag=menu_option_build] at @s run function zombies:build_kit/spawn_menu/hover/check_hover_build
execute as @e[type=text_display,tag=menu_option_music] at @s run function zombies:build_kit/spawn_menu/hover/check_hover_music
