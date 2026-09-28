# Public room-exit transition for the 115 launch and other map-owned systems.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @s[tag=de_ag_inside] run return 0

function zbk_der_eisendrache:anti_gravity/state/exit
