# Opens the Panzer Spawner submenu with current global Panzer round timing.

execute unless score #global wave.panzer_start_round matches 1.. run scoreboard players set #global wave.panzer_start_round 12
execute unless score #global wave.panzer_round_interval matches 1.. run scoreboard players set #global wave.panzer_round_interval 6

data modify storage zbk:temp panzer_spawner_dialog set value {first_round:12,repeat_every:6}
execute store result storage zbk:temp panzer_spawner_dialog.first_round int 1 run scoreboard players get #global wave.panzer_start_round
execute store result storage zbk:temp panzer_spawner_dialog.repeat_every int 1 run scoreboard players get #global wave.panzer_round_interval

function zbk:waves/build_kit/spawners/dialogs/show_panzer_dialog with storage zbk:temp panzer_spawner_dialog
