# Executed as the newly created mannequin.
scoreboard players set @s wall_spawn_timer 0
scoreboard players operation @s wall_spawn_health = #global wave.health
execute store result entity @s attributes[{id:"minecraft:max_health"}].base double 1 run scoreboard players get #global wave.health
execute store result entity @s Health float 1 run scoreboard players get #global wave.health
scoreboard players set @s wz_age 0
execute store result score @s wz_origin_y run data get entity @s Pos[1] 100
function zombies:waves/spawning/zombie/creation/from_marker
return 1
