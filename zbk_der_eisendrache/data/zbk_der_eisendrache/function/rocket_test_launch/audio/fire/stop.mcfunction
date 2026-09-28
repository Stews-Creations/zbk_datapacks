# Stop rocket-fire LP playback when the doors begin opening.
execute unless score #active zbk.de matches 1 run return 0

schedule clear zbk_der_eisendrache:rocket_test_launch/audio/fire/play_loop
stopsound @a master zbk_der_eisendrache:der_eisendrache.rocket_test_launch.rocket_ignite_lp
