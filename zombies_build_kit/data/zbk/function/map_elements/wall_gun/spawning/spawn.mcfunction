# ===================================
# WALL GUN - SPAWN
# ===================================
# Purpose: Detect named bats and create wall gun markers with orientation
# Runs every tick to check for new Wall Gun Marker bats
# ===================================

# For each Wall Gun Marker Bat, store yaw of nearest player
execute as @e[type=minecraft:bat,name="Wall Gun Marker"] at @s run execute as @p[distance=..50,sort=nearest] store result score @s playerYaw run data get entity @s Rotation[0] 1

# Facing South (yaw between -45 and 45) - Player looking south
execute as @e[type=minecraft:bat,name="Wall Gun Marker"] at @s if score @p playerYaw matches -45..45 run summon marker ~ ~ ~ {Tags:["wall_gun","wall_gun_south"],data:{gun_id:20,price:500,ammo_price:250,pap_ammo_price:4500}}

# Facing West (yaw between 45 and 135) - Player looking west
execute as @e[type=minecraft:bat,name="Wall Gun Marker"] at @s if score @p playerYaw matches 46..135 run summon marker ~ ~ ~ {Tags:["wall_gun","wall_gun_west"],data:{gun_id:20,price:500,ammo_price:250,pap_ammo_price:4500}}

# Facing North (yaw between 135..180 or -180..-135) - Player looking north
execute as @e[type=minecraft:bat,name="Wall Gun Marker"] at @s if score @p playerYaw matches 136..180 run summon marker ~ ~ ~ {Tags:["wall_gun","wall_gun_north"],data:{gun_id:20,price:500,ammo_price:250,pap_ammo_price:4500}}
execute as @e[type=minecraft:bat,name="Wall Gun Marker"] at @s if score @p playerYaw matches -180..-136 run summon marker ~ ~ ~ {Tags:["wall_gun","wall_gun_north"],data:{gun_id:20,price:500,ammo_price:250,pap_ammo_price:4500}}

# Facing East (yaw between -135..-46) - Player looking east
execute as @e[type=minecraft:bat,name="Wall Gun Marker"] at @s if score @p playerYaw matches -135..-46 run summon marker ~ ~ ~ {Tags:["wall_gun","wall_gun_east"],data:{gun_id:20,price:500,ammo_price:250,pap_ammo_price:4500}}

# Cleanup - kill the bat so it only runs once
execute as @e[type=minecraft:bat,name="Wall Gun Marker"] run kill @s

# Initialize displays for any new markers (only if bats were found)
execute if entity @e[type=marker,tag=wall_gun,tag=!wall_gun_initialized] run function zbk:map_elements/wall_gun/initialize
execute as @e[type=marker,tag=wall_gun,tag=!wall_gun_initialized] run tag @s add wall_gun_initialized
