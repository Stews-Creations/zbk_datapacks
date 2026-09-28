execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute if entity @e[type=marker,tag=de_er_marker] run return run tellraw @s {"text":"The marker still exists; use delete instead.","color":"yellow"}
function zbk_der_eisendrache:quest/bows/electric/reforging/management/reset
scoreboard players reset #placed de_er_state
tellraw @s {"text":"Reforging placement unregistered. Only use after manual marker deletion, not for an unloaded chunk.","color":"yellow"}
