# Opens the Dog Spawner submenu with current global dog round timing.

execute unless score #global wave.dog_start_round matches 1.. run scoreboard players set #global wave.dog_start_round 5
execute unless score #global wave.dog_round_interval matches 1.. run scoreboard players set #global wave.dog_round_interval 5

data modify storage zbk:temp dog_spawner_dialog set value {first_round:5,repeat_every:5}
execute store result storage zbk:temp dog_spawner_dialog.first_round int 1 run scoreboard players get #global wave.dog_start_round
execute store result storage zbk:temp dog_spawner_dialog.repeat_every int 1 run scoreboard players get #global wave.dog_round_interval

function zbk:waves/build_kit/spawners/dialogs/show_dog_dialog with storage zbk:temp dog_spawner_dialog
