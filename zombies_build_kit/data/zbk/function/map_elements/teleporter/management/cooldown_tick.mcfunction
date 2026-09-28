# Context: purchased start marker. Reset immediately on zero, including the tick that decrements to zero.

execute if score @s teleporter_cooldown matches 1.. run scoreboard players remove @s teleporter_cooldown 1
execute if score @s teleporter_cooldown matches 0 run function zbk:map_elements/teleporter/management/reset_single
