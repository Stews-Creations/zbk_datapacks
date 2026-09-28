# Checks whether the Panzer flamethrower can reach the candidate player.
# Runs as: candidate player, positioned on a 0.1-block ray step from the nozzle toward the player.

execute unless block ~ ~ ~ #zbk:raycast_pass run return 0
execute if entity @s[distance=..0.35] run scoreboard players set #panzer_flame_los_clear temp 1
execute if entity @s[distance=..0.35] run return 1
scoreboard players remove #panzer_flame_los_steps temp 1
execute if score #panzer_flame_los_steps temp matches ..0 run return 0
execute positioned ^ ^ ^0.1 run function zbk:bosses/panzer/attacks/flame_thrower/line_of_sight
