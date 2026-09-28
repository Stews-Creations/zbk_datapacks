kill @e[tag=rocket]
scoreboard players set #rocket rocket_launch 0
scoreboard players set #rocket rocket_height 0
scoreboard players set #rocket_ready global 1
schedule clear zbk_der_eisendrache:rocket/management/start_game
stopsound @a master zbk_der_eisendrache:der_eisendrache.rocket.rocket_liftoff
