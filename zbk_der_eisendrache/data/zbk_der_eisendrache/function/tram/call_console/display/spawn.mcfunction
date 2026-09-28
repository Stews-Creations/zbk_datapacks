# Runs as a persistent call-console marker.
execute if entity @s[tag=tram_call_console_north] run function zbk_der_eisendrache:tram/call_console/display/spawn_root {yaw:0f}
execute if entity @s[tag=tram_call_console_east] run function zbk_der_eisendrache:tram/call_console/display/spawn_root {yaw:-90f}
execute if entity @s[tag=tram_call_console_south] run function zbk_der_eisendrache:tram/call_console/display/spawn_root {yaw:180f}
execute if entity @s[tag=tram_call_console_west] run function zbk_der_eisendrache:tram/call_console/display/spawn_root {yaw:90f}
