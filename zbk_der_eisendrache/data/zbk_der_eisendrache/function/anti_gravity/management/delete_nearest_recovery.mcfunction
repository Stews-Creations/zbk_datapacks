execute unless score #active zbk.de matches 1 run return 0
execute unless entity @e[type=minecraft:marker,tag=de_ag_recovery,distance=..5] run return 0
kill @e[type=minecraft:marker,tag=de_ag_recovery,distance=..5,sort=nearest,limit=1]
tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Deleted the nearest recovery marker.","color":"green"}]
