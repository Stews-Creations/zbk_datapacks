# Portal marker and directional sensor positions for players with diagnostics enabled.
execute as @e[type=minecraft:marker,tag=de_ag_portal] at @s run particle minecraft:dust{color:[0.7,0.2,1.0],scale:1.0} ~ ~0.2 ~ 0 0 0 0 1 normal @a[tag=de_ag_debug]
execute as @e[type=minecraft:marker,tag=de_ag_portal] at @s positioned ^ ^0.2 ^2 run particle minecraft:dust{color:[0.1,1.0,0.3],scale:1.0} ~ ~ ~ 0.15 0.15 0.15 0 3 normal @a[tag=de_ag_debug]
execute as @e[type=minecraft:marker,tag=de_ag_portal] at @s positioned ^ ^0.2 ^-2 run particle minecraft:dust{color:[1.0,0.1,0.1],scale:1.0} ~ ~ ~ 0.15 0.15 0.15 0 3 normal @a[tag=de_ag_debug]
