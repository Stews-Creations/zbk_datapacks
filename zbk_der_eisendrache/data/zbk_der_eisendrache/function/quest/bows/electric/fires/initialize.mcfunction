# Explicit quest reset; switching owners never calls this.
kill @e[tag=de_el_fire_runtime]
scoreboard players reset * de_el_fire_lit
scoreboard players set #electric de_el_progress 0
scoreboard players set #de_el_fire_fx temp 0
scoreboard players set #de_el_fire_smoke temp 0
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=marker,tag=de_el_fire_marker] at @s run function zbk_der_eisendrache:quest/bows/electric/fires/display/sync with entity @s data
function zbk_der_eisendrache:quest/bows/electric/soul_pots/management/reset
