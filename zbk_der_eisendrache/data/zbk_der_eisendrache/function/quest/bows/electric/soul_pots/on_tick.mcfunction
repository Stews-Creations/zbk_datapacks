execute unless score #active zbk.de matches 1 run return 0
# Read native kill ownership before the dragon collector consumes its existing stone drop.
scoreboard players add #fx de_es_age 1
execute if score #fx de_es_age matches 4.. run scoreboard players set #fx de_es_age 0
execute if score #electric de_el_progress matches 2.. if score #fx de_es_age matches 0 as @e[type=marker,tag=de_es_pot] at @s if entity @a[distance=..48] run function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/pot with entity @s data
execute as @e[type=marker,tag=de_es_orb] at @s run function zbk_der_eisendrache:quest/bows/electric/soul_pots/animations/orb with entity @s data
execute as @a[scores={de_ec_pot=1..3}] at @s run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/tick
