# Runs as a tram root immediately before its departure countdown.
execute unless score #active zbk.de matches 1 run return 0
scoreboard players operation #tram_door_active_link global = @s tram_link_id
execute as @e[type=marker,tag=tram_platform_door,scores={tram_link_id=1..}] if score @s tram_link_id = #tram_door_active_link global at @s run function zbk_der_eisendrache:tram/doors/animations/close
