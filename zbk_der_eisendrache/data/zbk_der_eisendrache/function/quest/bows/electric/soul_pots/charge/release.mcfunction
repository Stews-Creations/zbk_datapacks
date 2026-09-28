function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/stop_charged_sound
# Snapshot this draw's pot for the synchronous ray, consuming the carried charge even on a miss.
scoreboard players reset @s de_ec_shot
execute store result score #de_ec_valid temp run function zbk_der_eisendrache:quest/bows/electric/soul_pots/charge/eligible
execute if score #de_ec_valid temp matches 1 if score @s bow_is_charged matches 1 if score @s de_ec_pot matches 1..3 run scoreboard players operation @s de_ec_shot = @s de_ec_pot
scoreboard players reset @s de_ec_pot
