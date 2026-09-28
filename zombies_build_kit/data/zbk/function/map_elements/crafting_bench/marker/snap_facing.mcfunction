# Round saved yaw to the nearest 90 degrees, including negative/wrapped angles.
execute store result score #facing cb_id run data get entity @s Rotation[0] 100
scoreboard players add #facing cb_id 4500
scoreboard players set #circle cb_id 36000
scoreboard players operation #facing cb_id %= #circle cb_id
scoreboard players set #quarter cb_id 9000
scoreboard players operation #facing cb_id /= #quarter cb_id
execute store result entity @s Rotation[0] float 90 run scoreboard players get #facing cb_id
data modify entity @s Rotation[1] set value 0f
