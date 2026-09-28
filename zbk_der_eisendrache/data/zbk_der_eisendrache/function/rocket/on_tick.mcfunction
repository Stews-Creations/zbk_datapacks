# Advance the rocket only while Der Eisendrache is selected.
execute unless score #active zbk.de matches 1 run return 0
execute if score #rocket rocket_launch matches 1 if entity @e[type=minecraft:block_display,tag=rocket_root,limit=1] run function zbk_der_eisendrache:rocket/movement/ascend
