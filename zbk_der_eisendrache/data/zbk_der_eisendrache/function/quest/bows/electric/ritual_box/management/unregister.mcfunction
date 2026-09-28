execute unless score #active zbk.de matches 1 run return 0
execute unless dimension minecraft:overworld run return 0
execute if entity @e[type=marker,tag=de_eb_marker] run return run tellraw @s {"text":"The marker still exists; use delete instead.","color":"yellow"}
function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/reset
kill @e[type=marker,tag=de_eb_marker]
scoreboard players reset #registered de_eb_state
tellraw @s {"text":"Electric ritual box unregistered. Pending bows are returned when their player has a free weapon slot. Only unregister manually deleted markers, not unloaded chunks.","color":"yellow"}
