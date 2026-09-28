# === DELETE POWERED DOOR ===
# Kills the nearest powered door marker and places open template to clear door blocks
# Handles all powered door subtypes: regular, stairs, power room, church

# === Regular powered door (not stairs, not power room, not church) ===
execute at @e[type=marker,tag=door_powered,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_south] run place template minecraft:zombies/door_powered_down ~-1 ~ ~ counterclockwise_90
execute at @e[type=marker,tag=door_powered,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_west] run place template minecraft:zombies/door_powered_down ~ ~ ~-1 none
execute at @e[type=marker,tag=door_powered,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_north] run place template minecraft:zombies/door_powered_down ~1 ~ ~ clockwise_90
execute at @e[type=marker,tag=door_powered,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered,tag=!door_powered_stairs,tag=!door_powered_power_room,tag=!door_powered_church,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_east] run place template minecraft:zombies/door_powered_down ~ ~ ~1 180

# === Powered stairs door ===
execute at @e[type=marker,tag=door_powered_stairs,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_stairs,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_south] run place template minecraft:zombies/powered_door_stairs_down ~-1 ~ ~ counterclockwise_90
execute at @e[type=marker,tag=door_powered_stairs,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_stairs,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_west] run place template minecraft:zombies/powered_door_stairs_down ~ ~ ~-1 none
execute at @e[type=marker,tag=door_powered_stairs,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_stairs,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_north] run place template minecraft:zombies/powered_door_stairs_down ~1 ~ ~ clockwise_90
execute at @e[type=marker,tag=door_powered_stairs,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_stairs,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_east] run place template minecraft:zombies/powered_door_stairs_down ~ ~ ~1 180

# === Powered power room door ===
execute at @e[type=marker,tag=door_powered_power_room,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_power_room,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_south] run place template minecraft:zombies/power_room_door_down ~-1 ~ ~ counterclockwise_90
execute at @e[type=marker,tag=door_powered_power_room,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_power_room,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_west] run place template minecraft:zombies/power_room_door_down ~ ~ ~-1 none
execute at @e[type=marker,tag=door_powered_power_room,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_power_room,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_north] run place template minecraft:zombies/power_room_door_down ~1 ~ ~ clockwise_90
execute at @e[type=marker,tag=door_powered_power_room,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_power_room,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_east] run place template minecraft:zombies/power_room_door_down ~ ~ ~1 180

# === Powered church door ===
execute at @e[type=marker,tag=door_powered_church,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_church,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_south] run place template minecraft:zombies/powered_church_delete ~-1 ~ ~ counterclockwise_90
execute at @e[type=marker,tag=door_powered_church,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_church,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_west] run place template minecraft:zombies/powered_church_delete ~ ~ ~-1 none
execute at @e[type=marker,tag=door_powered_church,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_church,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_north] run place template minecraft:zombies/powered_church_delete ~1 ~ ~ clockwise_90
execute at @e[type=marker,tag=door_powered_church,distance=..5,limit=1,sort=nearest] as @e[type=marker,tag=door_powered_church,distance=..5,limit=1,sort=nearest] if entity @s[tag=door_east] run place template minecraft:zombies/powered_church_delete ~ ~ ~1 180

# Kill any UI entities nearby (in case they exist)
kill @e[type=text_display,tag=door_text_display,distance=..5]
kill @e[type=text_display,tag=door_ui,distance=..5]
kill @e[type=interaction,tag=door_interaction,distance=..5]
kill @e[type=marker,tag=door_display_point,distance=..5]

# Kill the powered door marker
kill @e[type=marker,tag=door_powered,distance=..5,limit=1,sort=nearest]

tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Powered door deleted.","color":"red"}]
