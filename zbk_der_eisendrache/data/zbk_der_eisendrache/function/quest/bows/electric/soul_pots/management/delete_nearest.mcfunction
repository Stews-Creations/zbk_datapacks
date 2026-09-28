execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @e[type=marker,tag=de_es_pot,distance=..8] run return run tellraw @s {"text":"Stand within 8 blocks of the soul pot marker.","color":"yellow"}
function zbk_der_eisendrache:quest/bows/electric/soul_pots/management/delete with entity @e[type=marker,tag=de_es_pot,distance=..8,sort=nearest,limit=1] data
