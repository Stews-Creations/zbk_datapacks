# Scheduled callbacks recheck ownership before moving entities or playing sound.
execute unless score #active zbk.de matches 1 run return 0

# Count down each route independently.
execute as @e[type=block_display,tag=tram_route_display,scores={tram_timer=..199}] at @s run function zbk_der_eisendrache:tram/route/audio/tick
execute as @e[type=block_display,tag=tram_route_display,scores={tram_delay_timer=10}] at @s run function zbk_der_eisendrache:tram/doors/animations/close_linked
scoreboard players remove @e[type=block_display,tag=tram_route_display,scores={tram_delay_timer=1..}] tram_delay_timer 1
execute as @e[type=block_display,tag=tram_route_display,scores={tram_delay_timer=0}] at @s run function zbk_der_eisendrache:tram/route/audio/start
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_delay_timer=0}] tram_timer 0
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_delay_timer=0}] tram_delay_timer -1

# Move every tram whose delay has elapsed.
execute as @e[type=block_display,tag=tram_route_display,scores={tram_timer=..199}] at @s run function zbk_der_eisendrache:tram/route/move

# Continue while any tram is waiting or moving.
execute if entity @e[type=block_display,tag=tram_route_display,scores={tram_delay_timer=1..}] run schedule function zbk_der_eisendrache:tram/route/move_loop 1t replace
execute if entity @e[type=block_display,tag=tram_route_display,scores={tram_timer=..199}] run schedule function zbk_der_eisendrache:tram/route/move_loop 1t replace
