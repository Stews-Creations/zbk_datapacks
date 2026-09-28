# Place one persistent activation-plate marker at the executing player's feet.
execute unless score #active zbk.de matches 1 run return 0

scoreboard players set #plate_count de_ag_cycle 0
execute as @e[type=minecraft:marker,tag=de_ag_plate] run scoreboard players add #plate_count de_ag_cycle 1
execute if score #plate_count de_ag_cycle matches 4.. run tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"Four activation plates already exist.","color":"red"}]
execute if score #plate_count de_ag_cycle matches 4.. run return 0

summon minecraft:marker ~ ~ ~ {Tags:["de_ag_plate","de_ag_plate_new"]}
scoreboard players set @e[type=minecraft:marker,tag=de_ag_plate_new,distance=..1,limit=1,sort=nearest] de_ag_plate_t 0
execute as @e[type=minecraft:marker,tag=de_ag_plate_new,distance=..1,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:redstone_lamp run setblock ~ ~-1 ~ minecraft:redstone_lamp[lit=false]
tag @e[type=minecraft:marker,tag=de_ag_plate_new,distance=..1] remove de_ag_plate_new

scoreboard players add #plate_count de_ag_cycle 1
tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"Activation plate placed (","color":"green"},{"score":{"name":"#plate_count","objective":"de_ag_cycle"},"color":"aqua"},{"text":"/4).","color":"green"}]
