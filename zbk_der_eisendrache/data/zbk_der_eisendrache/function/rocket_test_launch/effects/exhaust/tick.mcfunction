# Context: selected exhaust at its position during the burn.
# Flame stays continuous while smoke retains the shared secondary-effect cadence.

function zbk_der_eisendrache:rocket_test_launch/effects/exhaust/flame
execute if score #rocket_test_launch rkt_fx_timer matches 0 run function zbk_der_eisendrache:rocket_test_launch/effects/exhaust/smoke
