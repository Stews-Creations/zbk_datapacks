# Preserve executor ordering; snapshot only center existence, not enemy state.
execute unless entity @e[type=breeze,tag=de_storm_breeze] run return 0
execute if score #active zbk.de matches 1 run function zbk_der_eisendrache:quest/bows/electric/storm/lookup/prepare
execute as @e[type=breeze,tag=de_storm_breeze] at @s run function zbk_der_eisendrache:quest/bows/electric/storm/animations/breeze_tick
function zbk_der_eisendrache:quest/bows/electric/storm/lookup/finish
