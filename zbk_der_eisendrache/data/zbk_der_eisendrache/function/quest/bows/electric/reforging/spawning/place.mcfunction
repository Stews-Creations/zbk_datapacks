# Stand at the arrow's base and face its desired display direction.
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"Select Der Eisendrache before placing the reforging arrow.","color":"yellow"}
execute unless dimension minecraft:overworld run return 0
execute if score #placed de_er_state matches 1 unless entity @e[type=marker,tag=de_er_marker] run return run tellraw @s {"text":"Load the old reforging marker before moving it.","color":"yellow"}
execute if entity @e[type=marker,tag=de_er_marker,scores={de_er_state=1}] run return run tellraw @s {"text":"Wait for the arrow sequence to finish before moving its marker.","color":"yellow"}
execute at @s align xz positioned ~0.5 ~ ~0.5 rotated as @s run function zbk_der_eisendrache:quest/bows/electric/reforging/marker/place_here
