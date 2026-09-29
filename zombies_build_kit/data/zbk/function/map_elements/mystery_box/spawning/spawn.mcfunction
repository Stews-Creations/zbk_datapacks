# === SPAWN MYSTERY BOX LOCATION ===
# Runs when a Mystery Box Location bat is detected

# For each Mystery Box Location Bat, Store yaw into a scoreboard objective "playerYaw"
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45° and 45°)
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -45..45 run place template zbk:mystery_box/mystery_box_location ~-1 ~ ~ counterclockwise_90
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -45..45 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add facing_south
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -45..45 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add disabled
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -45..45 as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/spawning/create_south

# Facing West (yaw between 45° and 135°)
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches 45..135 run place template zbk:mystery_box/mystery_box_location ~ ~ ~-1 none
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches 45..135 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add facing_west
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches 45..135 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add disabled
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches 45..135 as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/spawning/create_west

# Facing North (yaw between 135..180 or -180..-135)
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches 135..180 run place template zbk:mystery_box/mystery_box_location ~1 ~ ~ clockwise_90
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches 135..180 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add facing_north
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches 135..180 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add disabled
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches 135..180 as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/spawning/create_north
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -180..-135 run place template zbk:mystery_box/mystery_box_location ~1 ~ ~ clockwise_90
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -180..-135 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add facing_north
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -180..-135 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add disabled
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -180..-135 as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/spawning/create_north

# Facing East (yaw between -135..-45)
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -135..-45 run place template zbk:mystery_box/mystery_box_location ~ ~ ~1 180
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -135..-45 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add facing_east
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -135..-45 run tag @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] add disabled
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s if score @p playerYaw matches -135..-45 as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/mystery_box/spawning/create_east

# Summon interaction entity for click detection at each new mystery_box_location marker
execute as @e[type=minecraft:bat,name="Mystery Box Location"] at @s as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] at @s run summon minecraft:interaction ~ ~-0.5 ~ {width:1.5f,height:1.25f,response:true,Tags:["mystery_box_interaction"]}

# Reset all location IDs to sequential order (1, 2, 3, 4...)
function zbk:map_elements/mystery_box/locations/index/reset_ids

# Cleanup — remove the Bat so it only runs once
execute as @e[type=minecraft:bat,name="Mystery Box Location"] run kill @s
