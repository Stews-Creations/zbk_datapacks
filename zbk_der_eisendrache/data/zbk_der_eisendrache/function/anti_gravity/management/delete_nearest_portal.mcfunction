execute unless score #active zbk.de matches 1 run return 0

execute unless entity @e[type=minecraft:marker,tag=de_ag_portal,distance=..5,limit=1] run tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"No portal marker found within 5 blocks.","color":"red"}]
execute unless entity @e[type=minecraft:marker,tag=de_ag_portal,distance=..5,limit=1] run return 0

kill @e[type=minecraft:marker,tag=de_ag_portal,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"Deleted the nearest portal marker.","color":"green"}]
