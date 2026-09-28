# Check the player's center and four corners for actual owned wall-run support.
execute positioned ~ ~-0.01 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/player/check_support_cell
execute positioned ~-0.29 ~-0.01 ~-0.29 align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/player/check_support_cell
execute positioned ~-0.29 ~-0.01 ~0.29 align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/player/check_support_cell
execute positioned ~0.29 ~-0.01 ~-0.29 align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/player/check_support_cell
execute positioned ~0.29 ~-0.01 ~0.29 align xyz positioned ~0.5 ~0.5 ~0.5 run function zbk_der_eisendrache:anti_gravity/wall_run/player/check_support_cell
