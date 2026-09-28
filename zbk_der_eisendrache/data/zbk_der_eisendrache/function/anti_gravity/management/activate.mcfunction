# Manually activate the room. The pressure-plate sequence will call this later.
execute unless score #active zbk.de matches 1 run return 0
execute if score #room de_ag_state matches 1 run return 0

scoreboard players set #room de_ag_state 1
execute if entity @s[type=minecraft:player,tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"Room movement activated.","color":"green"}]
title @a[tag=de_ag_inside,tag=de_ag_debug] actionbar [{"text":"ANTI-GRAVITY ACTIVE","color":"light_purple","bold":true}]
function zbk_der_eisendrache:anti_gravity/audio/start
