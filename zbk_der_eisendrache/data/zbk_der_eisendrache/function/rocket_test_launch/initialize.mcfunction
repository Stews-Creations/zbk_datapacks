# Disarm the timer and cancel any sequence left over from the previous game.
scoreboard players set #rocket_test_launch rocket_test_time -1
scoreboard players set #rocket_test_launch rkt_test_state 0
scoreboard players set #rocket_test_launch rkt_fx_timer 0
scoreboard players set #rocket_test_launch rkt_hazard_timer 0
scoreboard players set #rocket_test_launch rkt_hazard_moved 0

schedule clear zbk_der_eisendrache:rocket_test_launch/sequence/countdown
schedule clear zbk_der_eisendrache:rocket_test_launch/sequence/door_close
schedule clear zbk_der_eisendrache:rocket_test_launch/sequence/rocket_burn
schedule clear zbk_der_eisendrache:rocket_test_launch/sequence/door_open
schedule clear zbk_der_eisendrache:rocket_test_launch/sequence/complete
schedule clear zbk_der_eisendrache:rocket_test_launch/effects/refresh_geyser
schedule clear zbk_der_eisendrache:rocket_test_launch/audio/fire/play_loop
stopsound @a master zbk_der_eisendrache:der_eisendrache.rocket_test_launch.rocket_ignite_lp

function zbk_der_eisendrache:rocket_test_launch/doors/initialize
