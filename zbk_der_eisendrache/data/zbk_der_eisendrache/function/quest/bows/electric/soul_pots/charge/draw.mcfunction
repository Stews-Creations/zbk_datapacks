execute if score @s bow_charge_time matches ..1 run function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/stop_charged_sound
execute if score @s bow_charge_time matches ..1 run scoreboard players reset @s de_ec_pot
execute store result score #de_ec_valid temp run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/eligible
execute unless score #de_ec_valid temp matches 1 run return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/cancel
execute unless score @s bow_charge_time matches 20.. run return 0
execute unless score @s de_ec_pot matches 1..3 run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/acquire
execute if score @s de_ec_pot matches 1..3 run function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/charged_sound
execute if score @s de_ec_pot matches 1..3 if score #fx de_es_age matches 0 anchored eyes positioned ^-0.3 ^-0.15 ^0.65 run function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/charged_bow
