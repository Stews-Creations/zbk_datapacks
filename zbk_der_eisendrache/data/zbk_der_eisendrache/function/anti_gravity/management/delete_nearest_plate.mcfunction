execute unless score #active zbk.de matches 1 run return 0

execute unless entity @e[type=minecraft:marker,tag=de_ag_plate,distance=..5,limit=1] run tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"No activation-plate marker found within 5 blocks.","color":"red"}]
execute unless entity @e[type=minecraft:marker,tag=de_ag_plate,distance=..5,limit=1] run return 0

execute as @e[type=minecraft:marker,tag=de_ag_plate,distance=..5,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:redstone_lamp run setblock ~ ~-1 ~ minecraft:redstone_lamp[lit=false]
kill @e[type=minecraft:marker,tag=de_ag_plate,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"Deleted the nearest activation-plate marker.","color":"green"}]
