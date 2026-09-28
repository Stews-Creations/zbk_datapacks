# Preserve executor ordering; snapshot only center existence, not enemy state.
execute unless entity @e[tag=zbk.enemy_stunned] run return 0
execute if score #active zbk.de matches 1 run function zbk_der_eisendrache:quest/bows/electric/storm/lookup/prepare
execute as @e[tag=zbk.enemy_stunned] at @s run function zbk_der_eisendrache:quest/bows/electric/storm/effects/hold
function zbk_der_eisendrache:quest/bows/electric/storm/lookup/finish
