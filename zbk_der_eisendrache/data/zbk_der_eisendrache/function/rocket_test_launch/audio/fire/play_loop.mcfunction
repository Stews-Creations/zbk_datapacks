# Check anchor presence once, then choose volume separately for each listener.
# One listener hears one sound even when multiple exhaust markers are configured.

# Repeat the measured 4.47-second rocket-fire LP while the burn is active.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #rocket_test_launch rkt_test_state matches 4 run return 0

execute if entity @e[type=minecraft:marker,tag=rocket_test_exhaust,limit=1] as @a at @s run function zbk_der_eisendrache:rocket_test_launch/audio/fire/play_loop_for_player

schedule function zbk_der_eisendrache:rocket_test_launch/audio/fire/play_loop 90t replace
