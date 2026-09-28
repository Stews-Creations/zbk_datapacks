# Finish only after the doors have completed their 56-tick opening time.
execute unless score #active zbk.de matches 1 run return 0
execute unless score #rocket_test_launch rkt_test_state matches 5 run return 0

scoreboard players set #rocket_test_launch rkt_test_state 0
function zbk_der_eisendrache:rocket_test_launch/timing/arm
