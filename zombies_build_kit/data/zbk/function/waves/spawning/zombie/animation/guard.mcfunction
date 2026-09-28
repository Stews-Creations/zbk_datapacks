# Runs as a live spawn mannequin. Health/death is checked by the caller first.
scoreboard players add @s wz_age 1
scoreboard players set #failure_reason wz_state 2
execute if score @s wz_age >= #animation_ticks wz_cfg run return run function zbk:waves/spawning/zombie/animation/fail
execute store result score #height wz_state run data get entity @s Pos[1] 100
scoreboard players operation #height wz_state -= @s wz_origin_y
scoreboard players set #failure_reason wz_state 3
execute if score #height wz_state >= #climb_height wz_cfg run return run function zbk:waves/spawning/zombie/animation/fail
return 1
