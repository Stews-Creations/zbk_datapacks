# Select the actual nearby placement ID; keep the operator as @s for feedback.
execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @e[type=marker,tag=de_el_fire_marker,distance=..8] run return run tellraw @s {"text":"No electric fire marker within 8 blocks. Stand beside the fire you want to remove.","color":"yellow"}
function zbk_der_eisendrache:quest/bows/electric/fires/management/delete with entity @e[type=marker,tag=de_el_fire_marker,distance=..8,sort=nearest,limit=1] data
