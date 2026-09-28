# Consume once, including on other maps; later piercing hits cannot add more orbs.
scoreboard players set #electric_orb_pending stats 0
execute if score #active zbk.de matches 1 run function zbk_der_eisendrache:quest/bows/electric/orb/spawning/spawn
