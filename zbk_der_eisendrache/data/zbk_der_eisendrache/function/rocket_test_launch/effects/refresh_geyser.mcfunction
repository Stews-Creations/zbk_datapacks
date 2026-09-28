# Keep the complete geyser visible throughout the warning, countdown, and burn.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #rocket_test_launch rkt_test_state matches 1..4 run return 0

execute as @e[type=minecraft:marker,tag=rocket_test_exhaust,limit=1] at @s run function zbk_der_eisendrache:rocket_test_launch/effects/spawn_geyser
schedule function zbk_der_eisendrache:rocket_test_launch/effects/refresh_geyser 20t replace
