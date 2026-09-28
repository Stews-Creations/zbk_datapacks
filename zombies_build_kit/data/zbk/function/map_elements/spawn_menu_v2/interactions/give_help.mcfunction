# Give the existing ZBK help book to the requesting player.
# @s = player who selected Help Book

advancement revoke @s only zbk:interaction_spawn_menu_v2_help
execute as @e[type=interaction,tag=spawn_menu_v2_interaction_help] run data remove entity @s interaction
execute unless score #global game_active matches 0 run return fail
execute if score #global cutscene_active matches 1.. run return fail

playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1
function zbk:build_kit/management/give_zbk_book
