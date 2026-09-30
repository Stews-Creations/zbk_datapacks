data modify storage zbk:hud round set value {text:"",width:0,layout:8}
scoreboard players operation #hud_round temp = #round_shown temp
scoreboard players set #round_width temp 0
execute if score #hud_round temp matches 1 run data modify storage zbk:hud round.text set value "\uE080"
execute if score #hud_round temp matches 2 run data modify storage zbk:hud round.text set value "\uE081"
execute if score #hud_round temp matches 3 run data modify storage zbk:hud round.text set value "\uE082"
execute if score #hud_round temp matches 4 run data modify storage zbk:hud round.text set value "\uE083"
execute if score #hud_round temp matches 5 run data modify storage zbk:hud round.text set value "\uE084"
execute if score #hud_round temp matches 1..5 run scoreboard players set #round_width temp 27
execute if score #hud_round temp matches 6.. run function zbk:player/actionbar/prepare/round/round_number
execute store result storage zbk:hud round.width int 1 run scoreboard players get #round_width temp
