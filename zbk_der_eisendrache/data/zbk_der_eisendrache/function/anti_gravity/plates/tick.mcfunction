# Reset the count before the marker pass and start the cycle only after every plate has contributed.

scoreboard players set #plates_complete de_ag_cycle 0
execute as @e[type=minecraft:marker,tag=de_ag_plate] at @s run function zbk_der_eisendrache:anti_gravity/plates/update_and_count
execute if score #plates_complete de_ag_cycle matches 4.. run function zbk_der_eisendrache:anti_gravity/cycle/start
