execute unless loaded ~ ~ ~ run return run kill @s
scoreboard players add @s bo3_rocket_age 1
execute if score @s bo3_rocket_age matches 35.. run return run kill @s
function zombies:combat/weapons/guns/bo3/projectile/load with entity @s data.profile
execute store result score #player stats run data get entity @s data.owner
scoreboard players set @s bo3_rocket_steps 0
execute rotated as @s run function zombies:combat/weapons/guns/bo3/projectile/step
tag @e[tag=raycast_hit] remove raycast_hit
