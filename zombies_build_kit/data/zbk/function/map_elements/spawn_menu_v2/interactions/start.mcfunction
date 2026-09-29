# Start the game using the marker's Cutscene setting.
# @s = player who selected Start Game

advancement revoke @s only zbk:interaction_spawn_menu_v2_start
execute as @e[type=interaction,tag=spawn_menu_v2_interaction_start] run data remove entity @s interaction
execute unless score #global game_active matches 0 run return fail
execute if score #global cutscene_active matches 1.. run return fail

playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1
function zbk:game/settings/start_round/reset
function zbk:map_elements/spawn_menu_v2/management/start_from_setting
