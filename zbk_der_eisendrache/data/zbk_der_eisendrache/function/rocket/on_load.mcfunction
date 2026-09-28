scoreboard objectives add rocket_launch dummy
scoreboard objectives add rocket_height dummy
scoreboard players set #rocket rocket_launch 0
scoreboard players set #rocket rocket_height 0
scoreboard players set #rocket_ready global 1
scoreboard players set #rocket_skip_reset global 0

# Remove any callback left scheduled by an earlier datapack version.
schedule clear zbk_der_eisendrache:rocket/movement/tick
