# Return Trams 1 and 2 to their linked Middle markers.
execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:tram/reward/reset
scoreboard players set #tram_arriving_sound global 1
scoreboard players set #tram_departing_sound global 0
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_sway_timer 0
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_reward 0
tag @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] remove tram_swaying
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_destination 2
execute as @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] at @s run function zbk_der_eisendrache:tram/doors/animations/close_linked
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_timer 200
scoreboard players set @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2}] tram_delay_timer 10
execute if entity @e[type=block_display,tag=tram_route_display,scores={tram_link_id=1..2,tram_delay_timer=0..}] run schedule function zbk_der_eisendrache:tram/route/move_loop 1t replace
