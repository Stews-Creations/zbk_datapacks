execute unless loaded ~ ~ ~ run return 0
execute if block ~ ~ ~ #minecraft:flower_pots align xyz positioned ~0.5 ~0.4 ~0.5 run return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/marker/place_here with storage zombies:de_soul_pots placement
execute unless block ~ ~ ~ #zbk:raycast_pass run return run tellraw @s {"text":"Aim at a flower pot within 8 blocks.","color":"yellow"}
scoreboard players add #de_es_ray temp 1
execute if score #de_es_ray temp matches ..80 positioned ^ ^ ^0.1 run return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/marker/look
tellraw @s {"text":"Aim at a flower pot within 8 blocks.","color":"yellow"}
