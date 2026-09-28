# === SAVE CUSTOM DOOR ZONE ===
# Clones the zone between two linked corners to zbk:door_storage dimension
# Stores metadata on Corner 1 marker

# Find nearest custom_door marker
execute as @p at @s unless entity @e[type=marker,tag=custom_door,distance=..5,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"No custom door marker nearby","color":"red"}]
execute as @p at @s unless entity @e[type=marker,tag=custom_door,distance=..5,limit=1] run return 0

# Tag nearest marker
execute as @p at @s run tag @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] add cd_save_self

# Get link ID
execute store result score #cd_save_id global run scoreboard players get @e[tag=cd_save_self,limit=1] custom_door_id

# Check if ID is 0 (unlinked)
execute if score #cd_save_id global matches 0 run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Marker has no Link ID assigned","color":"red"}]
execute if score #cd_save_id global matches 0 run tag @e[tag=cd_save_self] remove cd_save_self
execute if score #cd_save_id global matches 0 run return 0

# Find partner with matching ID
execute as @e[type=marker,tag=custom_door,tag=!cd_save_self] if score @s custom_door_id = #cd_save_id global run tag @s add cd_save_partner

# Check if partner was found
execute unless entity @e[tag=cd_save_partner] run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"No linked partner found (assign matching IDs to both corners)","color":"red"}]
execute unless entity @e[tag=cd_save_partner] run tag @e[tag=cd_save_self] remove cd_save_self
execute unless entity @e[tag=cd_save_partner] run return 0

# Check for duplicate IDs (more than 1 partner = more than 2 markers share this ID)
execute store result score #cd_partner_count global if entity @e[tag=cd_save_partner]
execute if score #cd_partner_count global matches 2.. run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Duplicate Link ID! Multiple markers share ID ","color":"red"},{"score":{"name":"#cd_save_id","objective":"global"},"color":"yellow"},{"text":". Each ID must be used by exactly 2 markers.","color":"red"}]
execute if score #cd_partner_count global matches 2.. run tag @e[tag=cd_save_self] remove cd_save_self
execute if score #cd_partner_count global matches 2.. run tag @e[tag=cd_save_partner] remove cd_save_partner
execute if score #cd_partner_count global matches 2.. run return 0

# Determine Corner 1 (where we store data)
# If self is Corner 1, use it; else use partner; fallback to self
execute if entity @e[tag=cd_save_self,tag=custom_door_1] run tag @e[tag=cd_save_self] add cd_save_target
execute unless entity @e[tag=cd_save_target] if entity @e[tag=cd_save_partner,tag=custom_door_1] run tag @e[tag=cd_save_partner] add cd_save_target
execute unless entity @e[tag=cd_save_target] run tag @e[tag=cd_save_self] add cd_save_target

# === Get positions (data get floors automatically) ===
execute store result score #cd_x1 global run data get entity @e[tag=cd_save_self,limit=1] Pos[0]
execute store result score #cd_y1 global run data get entity @e[tag=cd_save_self,limit=1] Pos[1]
execute store result score #cd_z1 global run data get entity @e[tag=cd_save_self,limit=1] Pos[2]
execute store result score #cd_x2 global run data get entity @e[tag=cd_save_partner,limit=1] Pos[0]
execute store result score #cd_y2 global run data get entity @e[tag=cd_save_partner,limit=1] Pos[1]
execute store result score #cd_z2 global run data get entity @e[tag=cd_save_partner,limit=1] Pos[2]

# === Compute min/max per axis ===
scoreboard players operation #cd_min_x global = #cd_x1 global
scoreboard players operation #cd_max_x global = #cd_x1 global
execute if score #cd_x2 global < #cd_min_x global run scoreboard players operation #cd_min_x global = #cd_x2 global
execute if score #cd_x2 global > #cd_max_x global run scoreboard players operation #cd_max_x global = #cd_x2 global

scoreboard players operation #cd_min_y global = #cd_y1 global
scoreboard players operation #cd_max_y global = #cd_y1 global
execute if score #cd_y2 global < #cd_min_y global run scoreboard players operation #cd_min_y global = #cd_y2 global
execute if score #cd_y2 global > #cd_max_y global run scoreboard players operation #cd_max_y global = #cd_y2 global

scoreboard players operation #cd_min_z global = #cd_z1 global
scoreboard players operation #cd_max_z global = #cd_z1 global
execute if score #cd_z2 global < #cd_min_z global run scoreboard players operation #cd_min_z global = #cd_z2 global
execute if score #cd_z2 global > #cd_max_z global run scoreboard players operation #cd_max_z global = #cd_z2 global

# === Compute sizes ===
scoreboard players operation #cd_size_x global = #cd_max_x global
scoreboard players operation #cd_size_x global -= #cd_min_x global
scoreboard players add #cd_size_x global 1

scoreboard players operation #cd_size_y global = #cd_max_y global
scoreboard players operation #cd_size_y global -= #cd_min_y global
scoreboard players add #cd_size_y global 1

scoreboard players operation #cd_size_z global = #cd_max_z global
scoreboard players operation #cd_size_z global -= #cd_min_z global
scoreboard players add #cd_size_z global 1

# === Check zone size (total volume max 100 blocks) ===
scoreboard players operation #cd_volume global = #cd_size_x global
scoreboard players operation #cd_volume global *= #cd_size_y global
scoreboard players operation #cd_volume global *= #cd_size_z global
execute if score #cd_volume global matches 1001.. run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Door too large! Doors are limited to 1000 blocks (currently ","color":"red"},{"score":{"name":"#cd_volume","objective":"global"},"color":"yellow"},{"text":")","color":"red"}]
execute if score #cd_volume global matches 1001.. run tag @e[tag=cd_save_self] remove cd_save_self
execute if score #cd_volume global matches 1001.. run tag @e[tag=cd_save_partner] remove cd_save_partner
execute if score #cd_volume global matches 1001.. run tag @e[tag=cd_save_target] remove cd_save_target
execute if score #cd_volume global matches 1001.. run return 0

# === Compute storage coords: x = id * 100, y = 64, z = 0 ===
scoreboard players set #cd_const global 100
scoreboard players operation #cd_storage_x global = #cd_save_id global
scoreboard players operation #cd_storage_x global *= #cd_const global
scoreboard players set #cd_storage_y global 64
scoreboard players set #cd_storage_z global 0

# Storage end coords for forceload (storage_x + diff, storage_z + diff)
scoreboard players operation #cd_storage_end_x global = #cd_storage_x global
scoreboard players operation #cd_storage_end_x global += #cd_max_x global
scoreboard players operation #cd_storage_end_x global -= #cd_min_x global
scoreboard players operation #cd_storage_end_z global = #cd_storage_z global
scoreboard players operation #cd_storage_end_z global += #cd_max_z global
scoreboard players operation #cd_storage_end_z global -= #cd_min_z global

# === Store all values to temp storage for macro ===
execute store result storage zbk:temp save_zone.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zbk:temp save_zone.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zbk:temp save_zone.min_z int 1 run scoreboard players get #cd_min_z global
execute store result storage zbk:temp save_zone.max_x int 1 run scoreboard players get #cd_max_x global
execute store result storage zbk:temp save_zone.max_y int 1 run scoreboard players get #cd_max_y global
execute store result storage zbk:temp save_zone.max_z int 1 run scoreboard players get #cd_max_z global
execute store result storage zbk:temp save_zone.storage_x int 1 run scoreboard players get #cd_storage_x global
execute store result storage zbk:temp save_zone.storage_y int 1 run scoreboard players get #cd_storage_y global
execute store result storage zbk:temp save_zone.storage_z int 1 run scoreboard players get #cd_storage_z global
execute store result storage zbk:temp save_zone.storage_end_x int 1 run scoreboard players get #cd_storage_end_x global
execute store result storage zbk:temp save_zone.storage_end_z int 1 run scoreboard players get #cd_storage_end_z global

# === Execute clone ===
function zbk:build_kit/management/custom_door/zone/save_execute with storage zbk:temp save_zone

# === Store metadata on Corner 1 ===
data modify entity @e[tag=cd_save_target,limit=1] data.saved_zone set value {}
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.min_x int 1 run scoreboard players get #cd_min_x global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.min_y int 1 run scoreboard players get #cd_min_y global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.min_z int 1 run scoreboard players get #cd_min_z global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.max_x int 1 run scoreboard players get #cd_max_x global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.max_y int 1 run scoreboard players get #cd_max_y global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.max_z int 1 run scoreboard players get #cd_max_z global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.size_x int 1 run scoreboard players get #cd_size_x global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.size_y int 1 run scoreboard players get #cd_size_y global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.size_z int 1 run scoreboard players get #cd_size_z global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.storage_x int 1 run scoreboard players get #cd_storage_x global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.storage_y int 1 run scoreboard players get #cd_storage_y global
execute store result entity @e[tag=cd_save_target,limit=1] data.saved_zone.storage_z int 1 run scoreboard players get #cd_storage_z global

# === Save block_display and item_display entities in zone ===
data modify entity @e[tag=cd_save_target,limit=1] data.saved_block_displays set value []
data modify entity @e[tag=cd_save_target,limit=1] data.saved_item_displays set value []

# Store zone bounds + sizes for cuboid selector macro
execute store result storage zbk:temp bd_zone.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zbk:temp bd_zone.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zbk:temp bd_zone.min_z int 1 run scoreboard players get #cd_min_z global
execute store result storage zbk:temp bd_zone.dx int 1 run scoreboard players get #cd_size_x global
execute store result storage zbk:temp bd_zone.dy int 1 run scoreboard players get #cd_size_y global
execute store result storage zbk:temp bd_zone.dz int 1 run scoreboard players get #cd_size_z global

# Tag block_displays and item_displays in zone, then recursively save their data
function zbk:build_kit/management/custom_door/zone/save_bd_tag_zone with storage zbk:temp bd_zone
function zbk:build_kit/management/custom_door/zone/save_block_displays
function zbk:build_kit/management/custom_door/zone/save_item_displays

# Count saved displays
execute store result score #cd_bd_count global run data get entity @e[tag=cd_save_target,limit=1] data.saved_block_displays
execute store result score #cd_id_count global run data get entity @e[tag=cd_save_target,limit=1] data.saved_item_displays

# === Success message ===
tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Zone saved! ","color":"green"},{"text":"Size: ","color":"gray"},{"score":{"name":"#cd_size_x","objective":"global"},"color":"yellow"},{"text":"x","color":"gray"},{"score":{"name":"#cd_size_y","objective":"global"},"color":"yellow"},{"text":"x","color":"gray"},{"score":{"name":"#cd_size_z","objective":"global"},"color":"yellow"},{"text":" | ","color":"gray"},{"score":{"name":"#cd_bd_count","objective":"global"},"color":"yellow"},{"text":" block display(s) ","color":"gray"},{"score":{"name":"#cd_id_count","objective":"global"},"color":"yellow"},{"text":" item display(s)","color":"gray"}]

# === Refresh highlight (clear old cubes so auto_on re-triggers next tick) ===
execute as @e[type=magma_cube,tag=cd_highlight_cube] if score @s custom_door_id = #cd_save_id global run tp @s ~ -10000 ~
execute as @e[type=marker,tag=custom_door] if score @s custom_door_id = #cd_save_id global run tag @s remove cd_zone_active

# === Cleanup tags ===
tag @e[tag=cd_save_self] remove cd_save_self
tag @e[tag=cd_save_partner] remove cd_save_partner
tag @e[tag=cd_save_target] remove cd_save_target
