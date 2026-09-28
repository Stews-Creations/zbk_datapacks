execute unless score #active zbk.de matches 1 run return 0
# Arm the first Rocket Test cooldown after the first in-game forward teleport on Der Eisendrache.
execute unless score #global game_active matches 1.. run return 0
execute unless score #rocket_test_launch rkt_test_state matches 0 run return 0
execute unless score #rocket_test_launch rocket_test_time matches ..-1 run return 0

function zbk_der_eisendrache:rocket_test_launch/timing/arm
