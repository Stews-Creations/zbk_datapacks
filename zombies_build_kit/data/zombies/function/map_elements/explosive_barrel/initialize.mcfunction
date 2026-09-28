# Markers own placement. Clear runtime once before rebuilding all loaded barrels.
# Reconcile older saved assemblies as well as current item displays.
execute as @e[tag=explosive_barrel_display] on passengers run kill @s
kill @e[tag=explosive_barrel_display]
kill @e[type=minecraft:interaction,tag=explosive_barrel_interaction]
scoreboard players set @e[type=minecraft:marker,tag=explosive_barrel] barrel_health 100
tag @e[type=minecraft:marker,tag=explosive_barrel] remove explosive_barrel_exploded
execute as @e[type=minecraft:marker,tag=explosive_barrel] at @s run function zombies:map_elements/explosive_barrel/spawning/spawn_displays
