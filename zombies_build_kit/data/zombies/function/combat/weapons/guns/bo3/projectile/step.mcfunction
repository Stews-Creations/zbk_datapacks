# Fifteen swept 0.2-block samples = 3 blocks per tick, without tunnelling through walls.
execute unless loaded ~ ~ ~ run return run kill @s
execute unless block ~ ~ ~ #zombies:raycast_pass run return run function zombies:combat/weapons/guns/bo3/projectile/impact
function zombies:combat/weapons/mechanics/raycast/mobs
execute if entity @e[tag=raycast_hit] run return run kill @s
particle minecraft:smoke ~ ~ ~ 0 0 0 0 1
scoreboard players add @s bo3_rocket_steps 1
execute if score @s bo3_rocket_steps matches 15.. run return run tp @s ~ ~ ~
execute positioned ^ ^ ^0.2 run return run function zombies:combat/weapons/guns/bo3/projectile/step
