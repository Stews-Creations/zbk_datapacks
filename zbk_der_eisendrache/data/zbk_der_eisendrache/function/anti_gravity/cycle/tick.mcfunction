# Transition at zero-boundary; return prevents the new phase timer decrementing immediately.
execute if score #timer de_ag_cycle matches 1 if score #room de_ag_state matches 1 run return run function zbk_der_eisendrache:anti_gravity/cycle/start_off
execute if score #timer de_ag_cycle matches 1 unless score #room de_ag_state matches 1 run return run function zbk_der_eisendrache:anti_gravity/cycle/start_on
execute if score #timer de_ag_cycle matches 2.. run scoreboard players remove #timer de_ag_cycle 1
