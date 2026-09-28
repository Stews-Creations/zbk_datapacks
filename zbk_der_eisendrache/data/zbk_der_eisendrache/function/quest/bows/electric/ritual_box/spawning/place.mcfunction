execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute if score #registered de_eb_state matches 1 unless entity @e[type=marker,tag=de_eb_marker] run return run tellraw @s {"text":"Load the old electric ritual box before moving it.","color":"yellow"}
execute if score #phase de_eb_state matches 3..4 run return run tellraw @s {"text":"Collect the pending electric bow before moving this box.","color":"yellow"}
execute at @s align xz positioned ~0.5 ~ ~0.5 rotated as @s run function zbk_der_eisendrache:quest/bows/electric/ritual_box/marker/place_here
