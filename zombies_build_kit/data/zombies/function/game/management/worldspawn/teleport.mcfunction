# ===================================
# WORLDSPAWN - TELEPORT
# ===================================
# Purpose: Teleports the executing player to the worldspawn marker
# Skipped if player has disable_tp tag
# ===================================

execute if entity @s[tag=disable_tp] run return fail

execute if entity @e[type=text_display,tag=spawn_menu_v2_title,limit=1] at @e[type=marker,tag=worldspawn,limit=1] run tp @s ~ ~ ~ facing entity @e[type=text_display,tag=spawn_menu_v2_title,limit=1]
execute unless entity @e[type=text_display,tag=spawn_menu_v2_title,limit=1] if entity @e[type=text_display,tag=menu_title,limit=1] at @e[type=marker,tag=worldspawn,limit=1] run tp @s ~ ~ ~ facing entity @e[type=text_display,tag=menu_title,limit=1]
execute unless entity @e[type=text_display,tag=spawn_menu_v2_title,limit=1] unless entity @e[type=text_display,tag=menu_title,limit=1] at @e[type=marker,tag=worldspawn,limit=1] run tp @s ~ ~ ~
