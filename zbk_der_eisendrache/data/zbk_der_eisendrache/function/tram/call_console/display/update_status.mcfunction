# Resolve the temporary Tram 2 status, then rewrite text NBT only on transitions.
scoreboard players set #tram_console_status global 0
execute if score #global tram_ee_timer matches 1.. run scoreboard players set #tram_console_status global 1
execute if entity @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=1..2,tram_delay_timer=0..}] run scoreboard players set #tram_console_status global 1
execute if entity @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=1..2,tram_timer=..199}] run scoreboard players set #tram_console_status global 1
execute if entity @e[type=minecraft:block_display,tag=tram_route_display,scores={tram_link_id=2,tram_destination=3,tram_timer=200,tram_delay_timer=..-1}] run scoreboard players set #tram_console_status global 2

execute if score #tram_console_status global matches 0 if entity @s[tag=!tram_call_console_status_call] run function zbk_der_eisendrache:tram/call_console/display/status/call
execute if score #tram_console_status global matches 1 if entity @s[tag=!tram_call_console_status_moving] run function zbk_der_eisendrache:tram/call_console/display/status/moving
execute if score #tram_console_status global matches 2 if entity @s[tag=!tram_call_console_status_platform] run function zbk_der_eisendrache:tram/call_console/display/status/platform
