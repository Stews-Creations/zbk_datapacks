# Scheduled completion 220 ticks (11 seconds) into the Stop clip.
execute unless score #active zbk.de matches 1 run function zbk_der_eisendrache:anti_gravity/management/cleanup
execute unless score #active zbk.de matches 1 run return 0
execute unless score #stopping de_ag_cycle matches 1 run return 0

scoreboard players set #stopping de_ag_cycle 0
scoreboard players set #room de_ag_state 0
execute as @a[tag=de_ag_effects] at @s run function zbk_der_eisendrache:anti_gravity/movement/remove
function zbk_der_eisendrache:anti_gravity/wall_run/platform/cleanup_all
title @a[tag=de_ag_inside,tag=de_ag_debug] actionbar [{"text":"ANTI-GRAVITY INACTIVE","color":"gray","bold":true}]
