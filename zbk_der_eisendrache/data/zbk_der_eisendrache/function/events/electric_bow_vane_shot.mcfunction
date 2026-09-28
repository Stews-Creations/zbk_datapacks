# Per-step hook only for the base bow profile; retain the shooter execution context.
execute unless score #active zbk.de matches 1 run return 0
return run function zbk_der_eisendrache:quest/bows/electric/weather_vane/interactions/check_shot
