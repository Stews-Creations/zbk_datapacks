# === LOAD CUSTOM DOOR ZONE ===
# Clones the saved zone from zbk:door_storage back to the overworld

# Find nearest custom_door marker
execute as @p at @s unless entity @e[type=marker,tag=custom_door,distance=..5,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"No custom door marker nearby","color":"red"}]
execute as @p at @s unless entity @e[type=marker,tag=custom_door,distance=..5,limit=1] run return 0

# Tag nearest marker
execute as @p at @s run tag @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] add cd_load_self

# Get link ID
execute store result score #cd_load_id global run scoreboard players get @e[tag=cd_load_self,limit=1] custom_door_id

# Check if ID is 0 (unlinked)
execute if score #cd_load_id global matches 0 run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Marker has no Link ID assigned","color":"red"}]
execute if score #cd_load_id global matches 0 run tag @e[tag=cd_load_self] remove cd_load_self
execute if score #cd_load_id global matches 0 run return 0

# Find partner with matching ID
execute as @e[type=marker,tag=custom_door,tag=!cd_load_self] if score @s custom_door_id = #cd_load_id global run tag @s add cd_load_partner

# Check if partner was found
execute unless entity @e[tag=cd_load_partner] run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"No linked partner found (assign matching IDs to both corners)","color":"red"}]
execute unless entity @e[tag=cd_load_partner] run tag @e[tag=cd_load_self] remove cd_load_self
execute unless entity @e[tag=cd_load_partner] run return 0

# Check for duplicate IDs (more than 1 partner = more than 2 markers share this ID)
execute store result score #cd_partner_count global if entity @e[tag=cd_load_partner]
execute if score #cd_partner_count global matches 2.. run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Duplicate Link ID! Multiple markers share ID ","color":"red"},{"score":{"name":"#cd_load_id","objective":"global"},"color":"yellow"},{"text":". Each ID must be used by exactly 2 markers.","color":"red"}]
execute if score #cd_partner_count global matches 2.. run tag @e[tag=cd_load_self] remove cd_load_self
execute if score #cd_partner_count global matches 2.. run tag @e[tag=cd_load_partner] remove cd_load_partner
execute if score #cd_partner_count global matches 2.. run return 0

# Determine Corner 1 (where data is stored)
execute if entity @e[tag=cd_load_self,tag=custom_door_1] run tag @e[tag=cd_load_self] add cd_load_target
execute unless entity @e[tag=cd_load_target] if entity @e[tag=cd_load_partner,tag=custom_door_1] run tag @e[tag=cd_load_partner] add cd_load_target
execute unless entity @e[tag=cd_load_target] run tag @e[tag=cd_load_self] add cd_load_target

# Check if saved data exists
execute unless data entity @e[tag=cd_load_target,limit=1] data.saved_zone run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"No saved zone data (use Save Zone first)","color":"red"}]
execute unless data entity @e[tag=cd_load_target,limit=1] data.saved_zone run tag @e[tag=cd_load_self] remove cd_load_self
execute unless data entity @e[tag=cd_load_target,limit=1] data.saved_zone run tag @e[tag=cd_load_partner] remove cd_load_partner
execute unless data entity @e[tag=cd_load_target,limit=1] data.saved_zone run tag @e[tag=cd_load_target] remove cd_load_target
execute unless data entity @e[tag=cd_load_target,limit=1] data.saved_zone run return 0

# === Read saved zone metadata into scoreboards ===
execute store result score #cd_min_x global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.min_x
execute store result score #cd_min_y global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.min_y
execute store result score #cd_min_z global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.min_z
execute store result score #cd_max_x global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.max_x
execute store result score #cd_max_y global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.max_y
execute store result score #cd_max_z global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.max_z
execute store result score #cd_storage_x global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.storage_x
execute store result score #cd_storage_y global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.storage_y
execute store result score #cd_storage_z global run data get entity @e[tag=cd_load_target,limit=1] data.saved_zone.storage_z

# === Compute storage end coords for forceload and clone source ===
# storage_end_x = storage_x + (max_x - min_x)
scoreboard players operation #cd_storage_end_x global = #cd_storage_x global
scoreboard players operation #cd_storage_end_x global += #cd_max_x global
scoreboard players operation #cd_storage_end_x global -= #cd_min_x global

# storage_end_y = storage_y + (max_y - min_y)
scoreboard players operation #cd_storage_end_y global = #cd_storage_y global
scoreboard players operation #cd_storage_end_y global += #cd_max_y global
scoreboard players operation #cd_storage_end_y global -= #cd_min_y global

# storage_end_z = storage_z + (max_z - min_z)
scoreboard players operation #cd_storage_end_z global = #cd_storage_z global
scoreboard players operation #cd_storage_end_z global += #cd_max_z global
scoreboard players operation #cd_storage_end_z global -= #cd_min_z global

# === Store values to temp storage for macro ===
execute store result storage zbk:temp load_zone.storage_x int 1 run scoreboard players get #cd_storage_x global
execute store result storage zbk:temp load_zone.storage_y int 1 run scoreboard players get #cd_storage_y global
execute store result storage zbk:temp load_zone.storage_z int 1 run scoreboard players get #cd_storage_z global
execute store result storage zbk:temp load_zone.storage_end_x int 1 run scoreboard players get #cd_storage_end_x global
execute store result storage zbk:temp load_zone.storage_end_y int 1 run scoreboard players get #cd_storage_end_y global
execute store result storage zbk:temp load_zone.storage_end_z int 1 run scoreboard players get #cd_storage_end_z global
execute store result storage zbk:temp load_zone.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zbk:temp load_zone.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zbk:temp load_zone.min_z int 1 run scoreboard players get #cd_min_z global

# === Execute clone (storage -> overworld) ===
function zbk:map_elements/custom_door/build_kit/door/zone/load_execute with storage zbk:temp load_zone

# === Restore block displays ===
# Compute zone sizes for cuboid selector
scoreboard players operation #cd_size_x global = #cd_max_x global
scoreboard players operation #cd_size_x global -= #cd_min_x global
scoreboard players add #cd_size_x global 1
scoreboard players operation #cd_size_y global = #cd_max_y global
scoreboard players operation #cd_size_y global -= #cd_min_y global
scoreboard players add #cd_size_y global 1
scoreboard players operation #cd_size_z global = #cd_max_z global
scoreboard players operation #cd_size_z global -= #cd_min_z global
scoreboard players add #cd_size_z global 1

# Kill existing block displays in zone (by position and by score)
execute store result storage zbk:temp bd_zone.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zbk:temp bd_zone.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zbk:temp bd_zone.min_z int 1 run scoreboard players get #cd_min_z global
execute store result storage zbk:temp bd_zone.dx int 1 run scoreboard players get #cd_size_x global
execute store result storage zbk:temp bd_zone.dy int 1 run scoreboard players get #cd_size_y global
execute store result storage zbk:temp bd_zone.dz int 1 run scoreboard players get #cd_size_z global
function zbk:map_elements/custom_door/reset/kill_zone_bd with storage zbk:temp bd_zone
execute as @e[type=block_display,tag=cd_door_bd] if score @s custom_door_id = #cd_load_id global run kill @s
execute as @e[type=item_display,tag=cd_door_id] if score @s custom_door_id = #cd_load_id global run kill @s

# Restore saved block displays
scoreboard players operation #cd_sign_id global = #cd_load_id global
data modify storage zbk:temp restore_bds set from entity @e[tag=cd_load_target,limit=1] data.saved_block_displays
function zbk:map_elements/custom_door/reset/restore_block_displays

# Restore saved item displays
data modify storage zbk:temp restore_ids set from entity @e[tag=cd_load_target,limit=1] data.saved_item_displays
function zbk:map_elements/custom_door/reset/restore_item_displays

# Count restored displays
execute store result score #cd_bd_count global run data get entity @e[tag=cd_load_target,limit=1] data.saved_block_displays
execute store result score #cd_id_count global run data get entity @e[tag=cd_load_target,limit=1] data.saved_item_displays

# === Success message ===
tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Zone loaded! ","color":"green"},{"text":"Blocks restored to overworld.","color":"gray"},{"text":" | ","color":"gray"},{"score":{"name":"#cd_bd_count","objective":"global"},"color":"yellow"},{"text":" block display(s) ","color":"gray"},{"score":{"name":"#cd_id_count","objective":"global"},"color":"yellow"},{"text":" item display(s)","color":"gray"}]

# === Cleanup tags ===
tag @e[tag=cd_load_self] remove cd_load_self
tag @e[tag=cd_load_partner] remove cd_load_partner
tag @e[tag=cd_load_target] remove cd_load_target
