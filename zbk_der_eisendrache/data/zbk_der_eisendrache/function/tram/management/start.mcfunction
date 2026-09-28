# Arm only auto-start trams with their individual start delays.
execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:tram/reward/reset
scoreboard players set #tram_arriving_sound global 1
scoreboard players set #tram_departing_sound global 1
scoreboard players set @e[type=block_display,tag=tram_route_display] tram_timer 200
scoreboard players set @e[type=block_display,tag=tram_route_display] tram_delay_timer -1
scoreboard players set @e[type=block_display,tag=tram_route_display] tram_sway_timer 0
scoreboard players set @e[type=block_display,tag=tram_route_display] tram_reward 0
tag @e[type=block_display,tag=tram_route_display] remove tram_swaying
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_auto_start=1}] tram_destination 2
execute as @e[type=block_display,tag=tram_route_display,scores={tram_auto_start=1}] run scoreboard players operation @s tram_delay_timer = @s tram_start_delay
execute as @e[type=block_display,tag=tram_route_display,scores={tram_auto_start=1}] run scoreboard players operation @s tram_delay_timer *= #ticks_per_second tram_const
# Reserve the final 10 ticks for closing the linked platform doors.
scoreboard players add @e[type=block_display,tag=tram_route_display,scores={tram_auto_start=1,tram_delay_timer=0..}] tram_delay_timer 10

# Debug message
function zbk:api/debug/info {f:"TRAM",m:"Tram started"}

# Start the countdown/movement loop only when at least one configured tram exists.
execute if entity @e[type=block_display,tag=tram_route_display,scores={tram_delay_timer=0..}] run schedule function zbk_der_eisendrache:tram/route/move_loop 1t replace
