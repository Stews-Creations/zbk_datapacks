# Remove the persistent v2 marker and all derived runtime entities.

execute if entity @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=1}] run function zombies:sounds/play/music_menu_stop
scoreboard players set #menu_music_timer global 0
kill @e[tag=spawn_menu_v2_runtime]
kill @e[type=marker,tag=spawn_menu_v2_marker]
