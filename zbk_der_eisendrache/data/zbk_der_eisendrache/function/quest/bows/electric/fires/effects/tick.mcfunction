# Rotate only the disposable effect anchor; the authored position never moves.
tp @s ~ ~ ~ ~8 0
execute unless score @s de_ec_fire matches 1 if score #de_el_fire_fx temp matches 0 at @s run function zbk_der_eisendrache:quest/bows/electric/fires/effects/tornado
execute unless score @s de_ec_fire matches 1 if score #de_el_fire_smoke temp matches 0 at @s run function zbk_der_eisendrache:quest/bows/electric/fires/effects/smoke
execute if score @s de_ec_fire matches 1 if score #de_el_fire_fx temp matches 0 at @s run function zbk_der_eisendrache:quest/bows/electric/fires/effects/electric_tornado
