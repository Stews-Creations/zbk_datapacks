execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless score #electric de_el_progress matches 3 run return 0
execute unless score @s id matches 1.. run return 0
execute unless score @s id = #1 de_bow_owner run return 0
execute if entity @s[team=downed] run return 0
execute if entity @s[gamemode=spectator] run return 0
execute if entity @e[type=marker,tag=de_er_marker,scores={de_er_state=2},distance=..6] run return run function zbk_der_eisendrache:quest/bows/electric/reforging/interactions/pickup
execute unless entity @e[type=marker,tag=de_er_marker,scores={de_er_state=0},distance=..6] run return 0
execute unless entity @e[type=item_display,tag=de_el_vane_head] run return run tellraw @s {"text":"Load the placed weather vane before starting the arrow sequence.","color":"yellow"}
execute as @e[type=marker,tag=de_er_marker,scores={de_er_state=0},distance=..6,limit=1] at @s run function zbk_der_eisendrache:quest/bows/electric/reforging/management/start
