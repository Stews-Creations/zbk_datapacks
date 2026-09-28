# Runs as a start marker and removes its currently linked tram model.
scoreboard players operation #active_tram_link global = @s tram_link_id
execute as @e[type=block_display,tag=tram_route_display] if score @s tram_link_id = #active_tram_link global at @s on passengers run kill @s
execute as @e[type=block_display,tag=tram_route_display] if score @s tram_link_id = #active_tram_link global run kill @s
