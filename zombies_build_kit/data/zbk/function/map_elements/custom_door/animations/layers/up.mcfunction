# ===================================
# CUSTOM DOOR - ANIMATE UP
# ===================================
# Deletes saved blocks one layer at a time from bottom to top
# Runs as sign marker, called from: animations/tick

# Read zone bounds from sign marker
execute store result score #cd_min_x global run data get entity @s data.anim_zone.min_x
execute store result score #cd_min_y global run data get entity @s data.anim_zone.min_y
execute store result score #cd_min_z global run data get entity @s data.anim_zone.min_z
execute store result score #cd_max_x global run data get entity @s data.anim_zone.max_x
execute store result score #cd_max_y global run data get entity @s data.anim_zone.max_y
execute store result score #cd_max_z global run data get entity @s data.anim_zone.max_z

# Compute which layer to delete: layer_y = min_y + step
scoreboard players operation #cd_layer_y global = #cd_min_y global
scoreboard players operation #cd_layer_y global += #cd_anim_step global

# Get storage coordinates and compute offsets
execute store result score #cd_storage_x global run data get entity @s data.anim_zone.storage_x
execute store result score #cd_storage_y global run data get entity @s data.anim_zone.storage_y
execute store result score #cd_storage_z global run data get entity @s data.anim_zone.storage_z
scoreboard players operation #cd_off_x global = #cd_storage_x global
scoreboard players operation #cd_off_x global -= #cd_min_x global
scoreboard players operation #cd_off_y global = #cd_storage_y global
scoreboard players operation #cd_off_y global -= #cd_min_y global
scoreboard players operation #cd_off_z global = #cd_storage_z global
scoreboard players operation #cd_off_z global -= #cd_min_z global

# Forceload storage chunks
scoreboard players operation #cd_storage_end_x global = #cd_storage_x global
scoreboard players operation #cd_storage_end_x global += #cd_max_x global
scoreboard players operation #cd_storage_end_x global -= #cd_min_x global
scoreboard players operation #cd_storage_end_z global = #cd_storage_z global
scoreboard players operation #cd_storage_end_z global += #cd_max_z global
scoreboard players operation #cd_storage_end_z global -= #cd_min_z global
execute store result storage zbk:temp fa_fl.sx int 1 run scoreboard players get #cd_storage_x global
execute store result storage zbk:temp fa_fl.sz int 1 run scoreboard players get #cd_storage_z global
execute store result storage zbk:temp fa_fl.ex int 1 run scoreboard players get #cd_storage_end_x global
execute store result storage zbk:temp fa_fl.ez int 1 run scoreboard players get #cd_storage_end_z global
function zbk:map_elements/custom_door/build_kit/door/highlight/forceload_add with storage zbk:temp fa_fl

# Selectively delete this layer (only saved non-air blocks)
scoreboard players operation #cd_sy global = #cd_layer_y global
scoreboard players operation #cd_sy global += #cd_off_y global
execute store result storage zbk:temp fa.sy int 1 run scoreboard players get #cd_sy global
execute store result storage zbk:temp fa.y int 1 run scoreboard players get #cd_layer_y global
scoreboard players operation #cd_loop_z global = #cd_min_z global
function zbk:map_elements/custom_door/animations/clearing/fill_air_scan_z

# Remove forceload
function zbk:map_elements/custom_door/build_kit/door/highlight/forceload_remove with storage zbk:temp fa_fl

# Kill block_displays and item_displays at this layer's Y
execute as @e[type=block_display,tag=cd_anim_bd] if score @s custom_door_id = #cd_sign_id global run function zbk:map_elements/custom_door/animations/clearing/check_layer_kill
execute as @e[type=item_display,tag=cd_anim_id] if score @s custom_door_id = #cd_sign_id global run function zbk:map_elements/custom_door/animations/clearing/check_layer_kill
