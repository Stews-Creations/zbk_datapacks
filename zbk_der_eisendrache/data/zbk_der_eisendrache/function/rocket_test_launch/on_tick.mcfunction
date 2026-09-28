# Run sequence particles even when a manual lobby test starts outside an active game.
function zbk_der_eisendrache:rocket_test_launch/effects/on_tick
function zbk_der_eisendrache:rocket_test_launch/hazard/on_tick

# Count down only while a Der Eisendrache game is active.
execute unless score #global game_active matches 1.. run return 0

execute if score #rocket_test_launch rocket_test_time matches 1.. run scoreboard players remove #rocket_test_launch rocket_test_time 1
execute if score #rocket_test_launch rocket_test_time matches 0 run function zbk_der_eisendrache:rocket_test_launch/management/launch
