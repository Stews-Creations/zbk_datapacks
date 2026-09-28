# === TAG MYSTERY BOX AS SPAWN LOCATION ===
# Called by trigger command from player
# Tags the nearest mystery box location marker as a spawn location

# Find nearest mystery box location marker within 5 blocks
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zombies:map_elements/mystery_box/location_manager/tag_spawn_location_execute
