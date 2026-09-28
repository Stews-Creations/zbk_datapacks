# Context: selected start marker. Read the updated delay before deciding whether recharge effects can begin.

execute if score @s teleporter_recharge_delay matches 1.. run scoreboard players remove @s teleporter_recharge_delay 1
execute if score @s teleporter_recharge_delay matches 0 run function zbk:map_elements/teleporter/management/play_recharging_sound
