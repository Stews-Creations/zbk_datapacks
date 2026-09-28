# Applies global Panzer special-round timing from the Panzer Spawners dialog.

$scoreboard players set #global wave.panzer_start_round $(first_round)
$scoreboard players set #global wave.panzer_round_interval $(repeat_every)

execute if score #global wave.panzer_start_round matches ..0 run scoreboard players set #global wave.panzer_start_round 1
execute if score #global wave.panzer_round_interval matches ..0 run scoreboard players set #global wave.panzer_round_interval 1

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Panzer rounds: first round ","color":"green"},{"score":{"name":"#global","objective":"wave.panzer_start_round"},"color":"yellow","bold":true},{"text":", repeat every ","color":"green"},{"score":{"name":"#global","objective":"wave.panzer_round_interval"},"color":"yellow","bold":true},{"text":" rounds.","color":"green"}]
function zombies:build_kit/management/spawner/dialogs/open_panzer_dialog
