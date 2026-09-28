# Incomplete plates are blue; completed plates are cyan.
execute as @e[type=minecraft:marker,tag=de_ag_plate,tag=!de_ag_plate_complete] at @s run particle minecraft:dust{color:[0.15,0.35,1.0],scale:1.0} ~ ~0.2 ~ 0.25 0.05 0.25 0 4 normal @a[tag=de_ag_debug]
execute as @e[type=minecraft:marker,tag=de_ag_plate,tag=de_ag_plate_complete] at @s run particle minecraft:dust{color:[0.25,1.0,1.0],scale:1.15} ~ ~0.2 ~ 0.3 0.06 0.3 0 6 normal @a[tag=de_ag_debug]
