# Run one menu raycast from the nearest player, then refresh every option.

tag @e[type=text_display,tag=spawn_menu_v2_runtime] remove being_looked_at
scoreboard players set #spawn_menu_v2_raycast_distance global 0

execute as @e[type=text_display,tag=spawn_menu_v2_title,limit=1] at @s if entity @a[distance=..10] as @a[distance=..10,limit=1,sort=nearest] at @s anchored eyes run function zombies:map_elements/spawn_menu_v2/raycast/cast

execute as @e[type=text_display,tag=spawn_menu_v2_option_start] run function zombies:map_elements/spawn_menu_v2/display/refresh_start
execute as @e[type=text_display,tag=spawn_menu_v2_option_cutscene] run function zombies:map_elements/spawn_menu_v2/display/refresh_cutscene
execute as @e[type=text_display,tag=spawn_menu_v2_option_music] run function zombies:map_elements/spawn_menu_v2/display/refresh_music
execute as @e[type=text_display,tag=spawn_menu_v2_option_help] run function zombies:map_elements/spawn_menu_v2/display/refresh_help

tag @e[type=text_display,tag=spawn_menu_v2_runtime] remove being_looked_at
