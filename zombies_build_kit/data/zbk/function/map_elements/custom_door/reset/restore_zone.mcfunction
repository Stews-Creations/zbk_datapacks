# ===================================
# CUSTOM DOOR - RESTORE ZONE
# ===================================
# Runs as sign marker. Clones blocks back from door_storage dimension.
# Called from: reset/reset

# Get sign's link ID
execute store result score #cd_sign_id global run scoreboard players get @s custom_door_id

# Skip if no link ID
execute if score #cd_sign_id global matches 0 run return 0

# Find Corner 1 with matching ID
execute as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_sign_id global run tag @s add cd_restore_corner

# Check if corner was found with saved data
execute unless entity @e[tag=cd_restore_corner] run return 0
execute unless data entity @e[tag=cd_restore_corner,limit=1] data.saved_zone run tag @e[tag=cd_restore_corner] remove cd_restore_corner
execute unless entity @e[tag=cd_restore_corner] run return 0

# Read saved zone metadata into scoreboards
execute store result score #cd_min_x global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.min_x
execute store result score #cd_min_y global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.min_y
execute store result score #cd_min_z global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.min_z
execute store result score #cd_max_x global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.max_x
execute store result score #cd_max_y global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.max_y
execute store result score #cd_max_z global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.max_z
execute store result score #cd_storage_x global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.storage_x
execute store result score #cd_storage_y global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.storage_y
execute store result score #cd_storage_z global run data get entity @e[tag=cd_restore_corner,limit=1] data.saved_zone.storage_z

# Compute storage end coords
scoreboard players operation #cd_storage_end_x global = #cd_storage_x global
scoreboard players operation #cd_storage_end_x global += #cd_max_x global
scoreboard players operation #cd_storage_end_x global -= #cd_min_x global

scoreboard players operation #cd_storage_end_y global = #cd_storage_y global
scoreboard players operation #cd_storage_end_y global += #cd_max_y global
scoreboard players operation #cd_storage_end_y global -= #cd_min_y global

scoreboard players operation #cd_storage_end_z global = #cd_storage_z global
scoreboard players operation #cd_storage_end_z global += #cd_max_z global
scoreboard players operation #cd_storage_end_z global -= #cd_min_z global

# Store values for macro
execute store result storage zbk:temp load_zone.storage_x int 1 run scoreboard players get #cd_storage_x global
execute store result storage zbk:temp load_zone.storage_y int 1 run scoreboard players get #cd_storage_y global
execute store result storage zbk:temp load_zone.storage_z int 1 run scoreboard players get #cd_storage_z global
execute store result storage zbk:temp load_zone.storage_end_x int 1 run scoreboard players get #cd_storage_end_x global
execute store result storage zbk:temp load_zone.storage_end_y int 1 run scoreboard players get #cd_storage_end_y global
execute store result storage zbk:temp load_zone.storage_end_z int 1 run scoreboard players get #cd_storage_end_z global
execute store result storage zbk:temp load_zone.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zbk:temp load_zone.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zbk:temp load_zone.min_z int 1 run scoreboard players get #cd_min_z global

# Kill ALL existing block_displays in zone before restoring
scoreboard players operation #cd_size_x global = #cd_max_x global
scoreboard players operation #cd_size_x global -= #cd_min_x global
scoreboard players add #cd_size_x global 1
scoreboard players operation #cd_size_y global = #cd_max_y global
scoreboard players operation #cd_size_y global -= #cd_min_y global
scoreboard players add #cd_size_y global 1
scoreboard players operation #cd_size_z global = #cd_max_z global
scoreboard players operation #cd_size_z global -= #cd_min_z global
scoreboard players add #cd_size_z global 1
execute store result storage zbk:temp bd_zone.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zbk:temp bd_zone.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zbk:temp bd_zone.min_z int 1 run scoreboard players get #cd_min_z global
execute store result storage zbk:temp bd_zone.dx int 1 run scoreboard players get #cd_size_x global
execute store result storage zbk:temp bd_zone.dy int 1 run scoreboard players get #cd_size_y global
execute store result storage zbk:temp bd_zone.dz int 1 run scoreboard players get #cd_size_z global
function zbk:map_elements/custom_door/reset/kill_zone_bd with storage zbk:temp bd_zone
execute as @e[type=block_display,tag=cd_door_bd] if score @s custom_door_id = #cd_sign_id global run kill @s
execute as @e[type=item_display,tag=cd_door_id] if score @s custom_door_id = #cd_sign_id global run kill @s

# Clone from storage back to overworld
function zbk:build_kit/management/custom_door/zone/load_execute with storage zbk:temp load_zone

# Restore saved block_displays
data modify storage zbk:temp restore_bds set from entity @e[tag=cd_restore_corner,limit=1] data.saved_block_displays
function zbk:map_elements/custom_door/reset/restore_block_displays

# Restore saved item_displays
data modify storage zbk:temp restore_ids set from entity @e[tag=cd_restore_corner,limit=1] data.saved_item_displays
function zbk:map_elements/custom_door/reset/restore_item_displays

# Cleanup
tag @e[tag=cd_restore_corner] remove cd_restore_corner
