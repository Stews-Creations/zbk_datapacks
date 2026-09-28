# Runs as a configured start marker.
function zbk_der_eisendrache:tram/model/summon
tag @e[type=block_display,tag=tram,tag=!tram_route_display,distance=..2,limit=1,sort=nearest] add tram_route_display
# Interpolate each per-tick root teleport so the tram and its passenger model move continuously client-side.
data merge entity @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] {teleport_duration:1}
scoreboard players operation @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_link_id = @s tram_link_id
scoreboard players operation @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_start_delay = @s tram_start_delay
scoreboard players operation @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_auto_start = @s tram_auto_start
# Keep the tram idle at its start marker until tram/start launches it.
scoreboard players set @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_timer 200
scoreboard players set @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_delay_timer -1
scoreboard players set @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_destination 0
scoreboard players set @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_sway_timer 0
scoreboard players set @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_motor_timer -1
scoreboard players set @e[type=block_display,tag=tram_route_display,distance=..2,limit=1,sort=nearest] tram_reward 0
