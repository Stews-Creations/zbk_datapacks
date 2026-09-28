# Runs as a persistent platform-door marker.
execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:tram/doors/collision/open
scoreboard players operation #tram_door_delete_id global = @s tram_door_id
execute as @e[type=block_display,tag=tram_door_panel] if score @s tram_door_id = #tram_door_delete_id global at @s on passengers run kill @s
execute as @e[type=block_display,tag=tram_door_panel] if score @s tram_door_id = #tram_door_delete_id global run kill @s
kill @s
