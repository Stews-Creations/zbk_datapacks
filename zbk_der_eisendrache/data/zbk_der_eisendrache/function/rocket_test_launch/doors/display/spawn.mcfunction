# Runs as one persistent center marker and creates movable and static left/right leaves.
execute if entity @s[tag=rocket_test_door_north] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_x
execute if entity @s[tag=rocket_test_door_south] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_x
execute if entity @s[tag=rocket_test_door_east] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_z
execute if entity @s[tag=rocket_test_door_west] run function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_z

# Duplicate both open side walls once. These copies remain static while the primary leaves move.
function zbk_der_eisendrache:rocket_test_launch/doors/display/spawn_backfill
