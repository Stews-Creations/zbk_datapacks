# Begin the shutdown cue while leaving anti-gravity active for 11 seconds.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #room de_ag_state matches 1 run return 0
execute if score #stopping de_ag_cycle matches 1 run return 0

scoreboard players set #stopping de_ag_cycle 1
function zbk_der_eisendrache:anti_gravity/audio/stop
schedule function zbk_der_eisendrache:anti_gravity/management/finish_deactivate 220t replace
execute if entity @s[type=minecraft:player,tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity] ","color":"light_purple"},{"text":"Room shutdown started.","color":"gray"}]
title @a[tag=de_ag_inside,tag=de_ag_debug] actionbar [{"text":"ANTI-GRAVITY SHUTTING DOWN","color":"light_purple","bold":true}]
