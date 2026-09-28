execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @e[type=marker,tag=de_er_marker] run return run tellraw @s {"text":"Load the reforging marker before deleting it.","color":"yellow"}
function zbk_der_eisendrache:quest/bows/electric/reforging/management/reset
kill @e[type=marker,tag=de_er_marker]
scoreboard players reset #placed de_er_state
tellraw @s {"text":"Reforging marker removed. Quest milestones and real blocks are unchanged.","color":"green"}
