# Runs as a persistent platform-door marker and creates its closed runtime panels.
execute if entity @s[tag=tram_platform_door_north] run function zbk_der_eisendrache:tram/doors/display/spawn_north
execute if entity @s[tag=tram_platform_door_south] run function zbk_der_eisendrache:tram/doors/display/spawn_south
execute if entity @s[tag=tram_platform_door_east] run function zbk_der_eisendrache:tram/doors/display/spawn_east
execute if entity @s[tag=tram_platform_door_west] run function zbk_der_eisendrache:tram/doors/display/spawn_west
