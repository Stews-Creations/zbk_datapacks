# Public launch entry point. Keep the map guard because this function can be called manually.
execute unless score #active zbk.de matches 1 run return 0
execute if score #rocket_test_launch rkt_test_state matches 1.. run return 0

# Disarm the cooldown until the complete warning, burn, and door cycle finishes.
scoreboard players set #rocket_test_launch rocket_test_time -1
function zbk_der_eisendrache:rocket_test_launch/sequence/warning
