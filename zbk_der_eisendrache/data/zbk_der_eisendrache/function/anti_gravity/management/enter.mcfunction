# Public room-entry transition for map-owned teleports and recovery.
execute unless score #active zbk.de matches 1 run return 0
execute if entity @s[tag=de_ag_inside] run return 0

function zbk_der_eisendrache:anti_gravity/state/enter
