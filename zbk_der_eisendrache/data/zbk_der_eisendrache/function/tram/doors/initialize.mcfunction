# Remove derived panels, reset every configured platform door closed, and rebuild it.
kill @e[tag=tram_door_model]
kill @e[type=block_display,tag=tram_door_panel]
tag @e[type=marker,tag=tram_platform_door] add tram_marker
scoreboard players set @e[type=marker,tag=tram_platform_door] tram_door_state 0
execute if score #active zbk.de matches 1 as @e[type=marker,tag=tram_platform_door,scores={tram_door_id=1..4}] at @s run function zbk_der_eisendrache:tram/doors/display/spawn
execute if score #active zbk.de matches 1 as @e[type=marker,tag=tram_platform_door,scores={tram_door_id=1..4}] at @s run function zbk_der_eisendrache:tram/doors/collision/close
execute unless score #active zbk.de matches 1 as @e[type=marker,tag=tram_platform_door] at @s run function zbk_der_eisendrache:tram/doors/collision/open
