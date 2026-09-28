# Toggle lobby music for the v2 menu.
# @s = player who selected Music

advancement revoke @s only zombies:interaction_spawn_menu_v2_music
execute as @e[type=interaction,tag=spawn_menu_v2_interaction_music] run data remove entity @s interaction
execute unless score #global game_active matches 0 run return fail
execute if score #global cutscene_active matches 1.. run return fail

playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1

execute as @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=0}] run tag @s add spawn_menu_v2_turn_on
execute as @e[type=marker,tag=spawn_menu_v2_marker,tag=!spawn_menu_v2_turn_on] run scoreboard players set @s spawn_menu_v2_music 0
execute as @e[type=marker,tag=spawn_menu_v2_marker,tag=spawn_menu_v2_turn_on] run scoreboard players set @s spawn_menu_v2_music 1
tag @e[type=marker,tag=spawn_menu_v2_marker] remove spawn_menu_v2_turn_on

execute as @e[type=text_display,tag=spawn_menu_v2_option_music] run function zombies:map_elements/spawn_menu_v2/display/refresh_music

execute if entity @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=0}] run function zombies:sounds/play/music_menu_stop
execute if entity @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=0}] run scoreboard players set #menu_music_timer global 0
execute if entity @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=1}] as @e[type=text_display,tag=spawn_menu_v2_title,limit=1] at @s run function zombies:sounds/play/music_menu
execute if entity @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=1}] run scoreboard players set #menu_music_timer global 0

execute if entity @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=1}] run tellraw @s [{"text":"[Spawn Menu] ","color":"gold"},{"text":"Menu music enabled","color":"green"}]
execute if entity @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_music=0}] run tellraw @s [{"text":"[Spawn Menu] ","color":"gold"},{"text":"Menu music disabled","color":"gray"}]
