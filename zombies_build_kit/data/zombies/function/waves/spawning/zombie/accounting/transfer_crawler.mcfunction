# Runs as the adult after confirmed crawler creation. Transfer, never allocate twice.
execute if entity @s[tag=wz_slot] run tag @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] add wz_slot
execute if score @s wz_speed matches 1..3 run scoreboard players operation @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] wz_speed = @s wz_speed
execute if score @s wz_source matches 1.. run scoreboard players operation @e[type=zombified_piglin,tag=new_crawler,limit=1,sort=nearest] wz_source = @s wz_source
tag @s remove wz_slot
tag @s remove wave_enemy
scoreboard players reset @s wz_speed
