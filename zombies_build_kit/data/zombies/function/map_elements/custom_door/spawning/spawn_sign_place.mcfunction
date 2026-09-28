# ===================================
# CUSTOM DOOR - PLACE SIGN AT POSITION
# ===================================
# Runs as endermite, at its snapped position. Creates sign marker + interaction + text display.

# Summon marker at position
summon marker ~ ~ ~ {Tags:["custom_door_sign"],data:{name:0,zones:[0]}}

# Determine player facing and store on marker
execute store result score #cd_sign_yaw global run data get entity @p[distance=..50,sort=nearest] Rotation[0] 1
execute if score #cd_sign_yaw global matches -45..45 run data modify entity @e[type=marker,tag=custom_door_sign,distance=..1,limit=1,sort=nearest] data.facing set value "south"
execute if score #cd_sign_yaw global matches 45..135 run data modify entity @e[type=marker,tag=custom_door_sign,distance=..1,limit=1,sort=nearest] data.facing set value "west"
execute if score #cd_sign_yaw global matches 135..180 run data modify entity @e[type=marker,tag=custom_door_sign,distance=..1,limit=1,sort=nearest] data.facing set value "north"
execute if score #cd_sign_yaw global matches -180..-135 run data modify entity @e[type=marker,tag=custom_door_sign,distance=..1,limit=1,sort=nearest] data.facing set value "north"
execute if score #cd_sign_yaw global matches -135..-45 run data modify entity @e[type=marker,tag=custom_door_sign,distance=..1,limit=1,sort=nearest] data.facing set value "east"

# Initialize scoreboard
scoreboard players set @e[type=marker,tag=custom_door_sign,distance=..1,limit=1,sort=nearest] custom_door_id 0

# Assign unique ID
scoreboard players add #cd_sign_uid_counter global 1
scoreboard players operation @e[type=marker,tag=custom_door_sign,distance=..1,limit=1,sort=nearest] cd_sign_uid = #cd_sign_uid_counter global

# Create UI entities (interaction + text) via shared function
execute as @e[type=marker,tag=custom_door_sign,distance=..1,limit=1,sort=nearest] at @s run function zombies:map_elements/custom_door/management/create_sign_ui

particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
execute as @a[distance=..10,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[CUSTOM DOOR] ","color":"green"},{"text":"Sign placed!","color":"gold"}]
