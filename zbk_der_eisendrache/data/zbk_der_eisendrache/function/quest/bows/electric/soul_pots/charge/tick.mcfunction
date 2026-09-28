execute unless score @s bow_charging matches 1.. run return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/cancel
execute if entity @s[nbt={Health:0.0f}] run return run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/cancel
# Remove stale charge after changing quest/weapon, death, or leaving the overworld.
execute store result score #de_ec_valid temp run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/eligible
execute unless score #de_ec_valid temp matches 1 run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/cancel
