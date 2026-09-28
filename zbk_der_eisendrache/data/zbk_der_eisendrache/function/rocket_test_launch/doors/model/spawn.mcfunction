# Dispatch tiled pieces directly from the exact four-block leaf controller.
execute if entity @s[tag=rocket_test_door_north,tag=!rocket_test_door_backfill] run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn_x {normal:-0.53f}
execute if entity @s[tag=rocket_test_door_south,tag=!rocket_test_door_backfill] run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn_x {normal:-0.47f}
execute if entity @s[tag=rocket_test_door_east,tag=!rocket_test_door_backfill] run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn_z {normal:-0.47f}
execute if entity @s[tag=rocket_test_door_west,tag=!rocket_test_door_backfill] run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn_z {normal:-0.53f}

# Keep the retained leaves on a slightly separate depth plane to prevent overlap flicker.
execute if entity @s[tag=rocket_test_door_north,tag=rocket_test_door_backfill] run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn_x {normal:-0.532f}
execute if entity @s[tag=rocket_test_door_south,tag=rocket_test_door_backfill] run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn_x {normal:-0.468f}
execute if entity @s[tag=rocket_test_door_east,tag=rocket_test_door_backfill] run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn_z {normal:-0.468f}
execute if entity @s[tag=rocket_test_door_west,tag=rocket_test_door_backfill] run function zbk_der_eisendrache:rocket_test_launch/doors/model/spawn_z {normal:-0.532f}
