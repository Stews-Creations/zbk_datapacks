# Applies global dog special-round timing from the Dog Spawners dialog.

$scoreboard players set #global wave.dog_start_round $(first_round)
$scoreboard players set #global wave.dog_round_interval $(repeat_every)

execute if score #global wave.dog_start_round matches ..0 run scoreboard players set #global wave.dog_start_round 1
execute if score #global wave.dog_round_interval matches ..0 run scoreboard players set #global wave.dog_round_interval 1

scoreboard players operation #global wave.next_dog = #global wave.dog_start_round
execute if score #global wave.round >= #global wave.dog_start_round run scoreboard players operation #global wave.next_dog = #global wave.round
execute if score #global wave.round >= #global wave.dog_start_round run scoreboard players operation #global wave.next_dog += #global wave.dog_round_interval

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Dog rounds: first round ","color":"green"},{"score":{"name":"#global","objective":"wave.dog_start_round"},"color":"yellow","bold":true},{"text":", repeat every ","color":"green"},{"score":{"name":"#global","objective":"wave.dog_round_interval"},"color":"yellow","bold":true},{"text":" rounds.","color":"green"}]
function zbk:build_kit/management/spawner/dialogs/open_dog_dialog
