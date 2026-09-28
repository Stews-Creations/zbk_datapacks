execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @e[type=marker,tag=de_eb_marker] run return run tellraw @s {"text":"Load the electric ritual marker before deleting it.","color":"yellow"}
function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/reset
kill @e[type=marker,tag=de_eb_marker]
scoreboard players reset #registered de_eb_state
tellraw @s {"text":"Electric ritual marker and its runtime removed. Your manually placed box is unchanged. Pending bows return when their player has a free weapon slot.","color":"yellow"}
