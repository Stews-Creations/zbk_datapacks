# ===================================
# SPAWN MENU V2 - INITIALIZE
# ===================================
# Persistent spawn_menu_v2_marker entities are authoritative.

kill @e[tag=spawn_menu_v2_runtime]
execute as @e[type=marker,tag=spawn_menu_v2_marker] at @s run function zombies:map_elements/spawn_menu_v2/spawning/create_runtime

execute as @e[type=interaction,tag=spawn_menu_v2_interaction] run data remove entity @s interaction
advancement revoke @a only zombies:interaction_spawn_menu_v2_start
advancement revoke @a only zombies:interaction_spawn_menu_v2_cutscene
advancement revoke @a only zombies:interaction_spawn_menu_v2_music
advancement revoke @a only zombies:interaction_spawn_menu_v2_help
