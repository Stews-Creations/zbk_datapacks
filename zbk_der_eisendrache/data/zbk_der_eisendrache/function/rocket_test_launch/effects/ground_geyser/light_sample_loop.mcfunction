# Generate one random floor position per recursion, then stop at zero samples.
execute unless score #rocket_test_ground_samples rkt_fx_timer matches 1.. run return 0
execute store result storage zombies:rocket_test_fx ground.x int 1 run random value 37..82
execute store result storage zombies:rocket_test_fx ground.z int 1 run random value 42..87
function zbk_der_eisendrache:rocket_test_launch/effects/ground_geyser/sample_light with storage zombies:rocket_test_fx ground
scoreboard players remove #rocket_test_ground_samples rkt_fx_timer 1
function zbk_der_eisendrache:rocket_test_launch/effects/ground_geyser/light_sample_loop
