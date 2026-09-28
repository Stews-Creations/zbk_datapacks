execute unless data entity @s data.gun_id run return 0
execute store result score #gun_id temp run data get entity @s data.gun_id
function zombies:combat/weapons/guns/bo3/migration/id
execute store result entity @s data.gun_id int 1 run scoreboard players get #gun_id temp
