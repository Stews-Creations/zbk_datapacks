# Check anchor presence once, then choose volume separately for each listener.
# One listener hears one sound even when multiple exhaust markers are configured.

# Start the rocket-fire audio at the launch-pad exhaust anchor.
execute unless score #active zbk.de matches 1 run return 0

schedule clear zbk_der_eisendrache:rocket_test_launch/audio/fire/play_loop
stopsound @a master zbk_der_eisendrache:der_eisendrache.rocket_test_launch.rocket_ignite_lp
execute if entity @e[type=minecraft:marker,tag=rocket_test_exhaust,limit=1] as @a at @s run function zbk_der_eisendrache:rocket_test_launch/audio/fire/start_for_player

schedule function zbk_der_eisendrache:rocket_test_launch/audio/fire/play_loop 40t replace
