# ===================================
# SPAWN MENU V2 - TICK
# ===================================

function zbk:map_elements/spawn_menu_v2/spawning/place_marker

execute if score #global game_active matches 0 unless score #global cutscene_active matches 1.. if entity @e[type=text_display,tag=spawn_menu_v2_title] run function zbk:map_elements/spawn_menu_v2/hover/detect
execute if score #global game_active matches 0 unless score #global cutscene_active matches 1.. if entity @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=1}] run function zbk:map_elements/spawn_menu_v2/music/on_tick
