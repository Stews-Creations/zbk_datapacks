# Creative building/testing works without starting a game, just like existing barriers.
# Spectators, explicit teleport bypass, and committed 115 flights remain exempt.
execute if entity @s[gamemode=spectator] run return run function zbk_der_eisendrache:anti_gravity/boundary/reset_player
execute if entity @s[tag=disable_tp] run return run function zbk_der_eisendrache:anti_gravity/boundary/reset_player
execute if entity @s[tag=115_launch_flying] run return run function zbk_der_eisendrache:anti_gravity/boundary/reset_player

# Sample actual height at 0.001-block precision, including outside marked zones.
execute store result score #bound_y de_ag_motion run data get entity @s Pos[1] 1000
execute unless entity @s[tag=de_ag_bound_init] run scoreboard players operation @s de_ag_bound_y = #bound_y de_ag_motion
execute unless entity @s[tag=de_ag_bound_init] run scoreboard players set @s de_ag_bound_rise 0
tag @s add de_ag_bound_init
execute if score @s de_ag_bound_rise matches 1.. run scoreboard players remove @s de_ag_bound_rise 1
execute if score #bound_y de_ag_motion > @s de_ag_bound_y run scoreboard players set @s de_ag_bound_rise 3
scoreboard players operation @s de_ag_bound_y = #bound_y de_ag_motion

# Levels 5 and 6 retain their existing behavior; level 2 checks the player's feet.
execute unless block ~ ~ ~ minecraft:light[level=2] run return 0
execute if entity @s[scores={de_ag_bound_cd=1..}] run return 0
execute if score #room de_ag_state matches 1 if entity @s[tag=de_ag_inside,tag=!de_ag_suppressed] run return run function zbk_der_eisendrache:anti_gravity/boundary/check_active
function zbk_der_eisendrache:anti_gravity/boundary/recover
