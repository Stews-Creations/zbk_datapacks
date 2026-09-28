# Runs as a recovered zombie or mannequin. Ordinary deaths never call this.
execute unless entity @s[tag=wz_slot] run return 0
tag @s remove wz_slot
tag @s remove wave_enemy
execute if score @s wz_speed matches 1 run scoreboard players add #global wave.spd_walkers 1
execute if score @s wz_speed matches 2 run scoreboard players add #global wave.spd_normals 1
execute if score @s wz_speed matches 3 run scoreboard players add #global wave.spd_fasts 1
scoreboard players reset @s wz_speed
function zbk:behavior/relocation/refund_spawn_slot
return 1
