scoreboard players operation #round_digit temp = #round_value temp
scoreboard players operation #round_digit temp %= #round_ten temp
execute if score #round_digit temp matches 0 run data modify storage zbk:hud round.digit set value "\uE070"
execute if score #round_digit temp matches 1 run data modify storage zbk:hud round.digit set value "\uE071"
execute if score #round_digit temp matches 2 run data modify storage zbk:hud round.digit set value "\uE072"
execute if score #round_digit temp matches 3 run data modify storage zbk:hud round.digit set value "\uE073"
execute if score #round_digit temp matches 4 run data modify storage zbk:hud round.digit set value "\uE074"
execute if score #round_digit temp matches 5 run data modify storage zbk:hud round.digit set value "\uE075"
execute if score #round_digit temp matches 6 run data modify storage zbk:hud round.digit set value "\uE076"
execute if score #round_digit temp matches 7 run data modify storage zbk:hud round.digit set value "\uE077"
execute if score #round_digit temp matches 8 run data modify storage zbk:hud round.digit set value "\uE078"
execute if score #round_digit temp matches 9 run data modify storage zbk:hud round.digit set value "\uE079"
function zbk:player/actionbar/prepare/round/round_prepend with storage zbk:hud round
scoreboard players add #round_width temp 9
scoreboard players operation #round_value temp /= #round_ten temp
execute if score #round_value temp matches 1.. run function zbk:player/actionbar/prepare/round/round_digit
