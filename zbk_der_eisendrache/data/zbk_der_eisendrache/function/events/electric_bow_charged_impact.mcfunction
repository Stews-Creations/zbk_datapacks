# Called at the first charged electric impact; #player stats is the shooter ID.
# Consume the request even on other maps so a shot can never spawn twice.
scoreboard players set #electric_storm_pending stats 0
execute if score #active zbk.de matches 1 run function zbk_der_eisendrache:quest/bows/electric/storm/spawning/spawn
