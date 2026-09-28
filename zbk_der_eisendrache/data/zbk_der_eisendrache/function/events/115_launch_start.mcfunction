# Commit the anti-gravity room exit for a player whose 115 flight is starting.
execute unless score #active zbk.de matches 1 run return 0

execute if entity @s[tag=de_ag_inside] run function zbk_der_eisendrache:anti_gravity/management/exit
