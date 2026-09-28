# Adopt loaded saved block-display cars before removing their assemblies.
# Reuse a nearby placement marker from a previous manual conversion.
execute as @e[type=minecraft:block_display,tag=floating_car] at @s unless entity @e[type=minecraft:marker,tag=floating_car_marker,distance=..1] run summon minecraft:marker ~ ~ ~ {Tags:["floating_car_marker"]}
execute as @e[type=minecraft:block_display,tag=floating_car] on passengers run kill @s
kill @e[type=minecraft:block_display,tag=floating_car]

# Restore every loaded placed car from its persistent origin, without altering couches.
kill @e[type=minecraft:item_display,tag=floating_car]
execute as @e[type=minecraft:marker,tag=floating_car_marker] at @s run function zbk:map_elements/floating_objects/model/car

# Adopt loaded saved trucks and remove their old passenger assemblies.
execute as @e[type=minecraft:block_display,tag=floating_truck] at @s unless entity @e[type=minecraft:marker,tag=floating_truck_marker,distance=..1] run summon minecraft:marker ~ ~ ~ {Tags:["floating_truck_marker"]}
execute as @e[type=minecraft:block_display,tag=floating_truck] on passengers run kill @s
kill @e[type=minecraft:block_display,tag=floating_truck]

# Rebuild one visual per persistent truck placement.
kill @e[type=minecraft:item_display,tag=floating_truck]
execute as @e[type=minecraft:marker,tag=floating_truck_marker] at @s run function zbk:map_elements/floating_objects/model/truck

# Couches retain their assemblies; configure both root and visible passengers.
execute as @e[type=block_display,tag=floating_couch] run data merge entity @s {view_range:0.5f}
execute as @e[type=block_display,tag=floating_couch] on passengers run data merge entity @s {view_range:0.5f}
