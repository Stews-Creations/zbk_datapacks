# === OPEN POWERED DOOR ===
# Called when power is activated
# Opens all powered doors by placing the _down variant templates

function zombies:debug/info {f:"DOOR",m:"Powered door opened"}

# Open all powered doors
# Original powered door
execute if entity @s[tag=door_south,tag=!door_powered_stairs,tag=!door_powered_power_room] at @s run place template minecraft:zombies/door_powered_down ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_west,tag=!door_powered_stairs,tag=!door_powered_power_room] at @s run place template minecraft:zombies/door_powered_down ~ ~ ~-1 none
execute if entity @s[tag=door_north,tag=!door_powered_stairs,tag=!door_powered_power_room] at @s run place template minecraft:zombies/door_powered_down ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_east,tag=!door_powered_stairs,tag=!door_powered_power_room] at @s run place template minecraft:zombies/door_powered_down ~ ~ ~1 180

# Powered stairs door
execute if entity @s[tag=door_powered_stairs,tag=door_south] at @s run place template minecraft:zombies/powered_door_stairs_down ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_powered_stairs,tag=door_west] at @s run place template minecraft:zombies/powered_door_stairs_down ~ ~ ~-1 none
execute if entity @s[tag=door_powered_stairs,tag=door_north] at @s run place template minecraft:zombies/powered_door_stairs_down ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_powered_stairs,tag=door_east] at @s run place template minecraft:zombies/powered_door_stairs_down ~ ~ ~1 180

# Powered power room door
execute if entity @s[tag=door_powered_power_room,tag=door_south] at @s run place template minecraft:zombies/power_room_door_down ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_powered_power_room,tag=door_west] at @s run place template minecraft:zombies/power_room_door_down ~ ~ ~-1 none
execute if entity @s[tag=door_powered_power_room,tag=door_north] at @s run place template minecraft:zombies/power_room_door_down ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_powered_power_room,tag=door_east] at @s run place template minecraft:zombies/power_room_door_down ~ ~ ~1 180

# Powered church door
execute if entity @s[tag=door_powered_church,tag=door_south] at @s run place template minecraft:zombies/powered_church_open ~-1 ~ ~ counterclockwise_90
execute if entity @s[tag=door_powered_church,tag=door_west] at @s run place template minecraft:zombies/powered_church_open ~ ~ ~-1 none
execute if entity @s[tag=door_powered_church,tag=door_north] at @s run place template minecraft:zombies/powered_church_open ~1 ~ ~ clockwise_90
execute if entity @s[tag=door_powered_church,tag=door_east] at @s run place template minecraft:zombies/powered_church_open ~ ~ ~1 180

# Tag powered doors as purchased
tag @s add purchased

# Unlock spawners for powered door zones
function zombies:map_elements/door/management/unlock_spawners_for_zones

# Update powered door displays
function zombies:map_elements/door/purchasable/update_display
