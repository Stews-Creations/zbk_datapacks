# Check a 3x2 footprint: three cells at the player and three cells one block ahead.
# Pitch is flattened so only yaw affects forward and sideways directions; nothing behind is checked.
execute rotated ~ 0 positioned ^-1 ^-1 ^ align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/detection/check
execute rotated ~ 0 positioned ^ ^-1 ^ align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/detection/check
execute rotated ~ 0 positioned ^1 ^-1 ^ align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/detection/check
execute rotated ~ 0 positioned ^-1 ^-1 ^1 align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/detection/check
execute rotated ~ 0 positioned ^ ^-1 ^1 align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/detection/check
execute rotated ~ 0 positioned ^1 ^-1 ^1 align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/detection/check
