# Stand on safe full-block ground inside the room, outside every blocking light zone.
execute unless score #active zbk.de matches 1 run tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Select Der Eisendrache (Der Eisendrache) before placing recovery markers. A running game is not required.","color":"red"}]
execute unless score #active zbk.de matches 1 run return 0
execute store result score #bound_valid de_ag_motion run function zbk_der_eisendrache:anti_gravity/validation/recovery_destination
execute unless score #bound_valid de_ag_motion matches 1 run tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Choose clear space on solid ground, outside light levels 2, 5, and 6 and wall-run platforms.","color":"red"}]
execute unless score #bound_valid de_ag_motion matches 1 run return 0
execute if entity @e[type=minecraft:marker,tag=de_ag_recovery,distance=..0.5] run tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"A recovery marker already exists within 0.5 blocks of this position.","color":"yellow"}]
execute if entity @e[type=minecraft:marker,tag=de_ag_recovery,distance=..0.5] run return 0
summon minecraft:marker ~ ~ ~ {Tags:["de_ag_recovery"]}
tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Recovery marker placed. Level-2 zones use the nearest marker within 32 blocks.","color":"green"}]
