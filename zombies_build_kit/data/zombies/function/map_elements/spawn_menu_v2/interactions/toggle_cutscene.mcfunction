# Toggle whether Start Game uses the configured opening cutscene.
# @s = player who selected Cutscene

advancement revoke @s only zombies:interaction_spawn_menu_v2_cutscene
execute as @e[type=interaction,tag=spawn_menu_v2_interaction_cutscene] run data remove entity @s interaction
execute unless score #global game_active matches 0 run return fail
execute if score #global cutscene_active matches 1.. run return fail

playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1

execute as @e[type=marker,tag=spawn_menu_v2_marker,scores={spawn_menu_v2_cutscene=0}] run tag @s add spawn_menu_v2_turn_on
execute as @e[type=marker,tag=spawn_menu_v2_marker,tag=!spawn_menu_v2_turn_on] run scoreboard players set @s spawn_menu_v2_cutscene 0
execute as @e[type=marker,tag=spawn_menu_v2_marker,tag=spawn_menu_v2_turn_on] run scoreboard players set @s spawn_menu_v2_cutscene 1
tag @e[type=marker,tag=spawn_menu_v2_marker] remove spawn_menu_v2_turn_on

execute as @e[type=text_display,tag=spawn_menu_v2_option_cutscene] run function zombies:map_elements/spawn_menu_v2/display/refresh_cutscene
execute if score @e[type=marker,tag=spawn_menu_v2_marker,limit=1] spawn_menu_v2_cutscene matches 1 run tellraw @s [{"text":"[Spawn Menu] ","color":"gold"},{"text":"Opening cutscene enabled","color":"green"}]
execute if score @e[type=marker,tag=spawn_menu_v2_marker,limit=1] spawn_menu_v2_cutscene matches 0 run tellraw @s [{"text":"[Spawn Menu] ","color":"gold"},{"text":"Opening cutscene disabled","color":"gray"}]
