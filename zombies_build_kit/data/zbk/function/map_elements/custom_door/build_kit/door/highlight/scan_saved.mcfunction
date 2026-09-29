# === SCAN SAVED ZONE BLOCKS ===
# Called from auto_on when saved_zone data exists on Corner 1
# Checks blocks in zbk:door_storage and summons highlight cubes in overworld

# === Get positions (data get floors automatically) ===
execute store result score #cd_x1 global run data get entity @e[tag=cd_highlight_self,limit=1] Pos[0]
execute store result score #cd_y1 global run data get entity @e[tag=cd_highlight_self,limit=1] Pos[1]
execute store result score #cd_z1 global run data get entity @e[tag=cd_highlight_self,limit=1] Pos[2]
execute store result score #cd_x2 global run data get entity @e[tag=cd_highlight_partner,limit=1] Pos[0]
execute store result score #cd_y2 global run data get entity @e[tag=cd_highlight_partner,limit=1] Pos[1]
execute store result score #cd_z2 global run data get entity @e[tag=cd_highlight_partner,limit=1] Pos[2]

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

# === Get storage coordinates from saved zone ===
execute store result score #cd_storage_x global run data get entity @e[tag=cd_highlight_c1,limit=1] data.saved_zone.storage_x
execute store result score #cd_storage_y global run data get entity @e[tag=cd_highlight_c1,limit=1] data.saved_zone.storage_y
execute store result score #cd_storage_z global run data get entity @e[tag=cd_highlight_c1,limit=1] data.saved_zone.storage_z

# Compute offsets: add to overworld coord to get storage coord
scoreboard players operation #cd_off_x global = #cd_storage_x global
scoreboard players operation #cd_off_x global -= #cd_min_x global
scoreboard players operation #cd_off_y global = #cd_storage_y global
scoreboard players operation #cd_off_y global -= #cd_min_y global
scoreboard players operation #cd_off_z global = #cd_storage_z global
scoreboard players operation #cd_off_z global -= #cd_min_z global

# Compute storage end coords for forceload
scoreboard players operation #cd_storage_end_x global = #cd_storage_x global
scoreboard players operation #cd_storage_end_x global += #cd_max_x global
scoreboard players operation #cd_storage_end_x global -= #cd_min_x global
scoreboard players operation #cd_storage_end_z global = #cd_storage_z global
scoreboard players operation #cd_storage_end_z global += #cd_max_z global
scoreboard players operation #cd_storage_end_z global -= #cd_min_z global

# Forceload storage chunks
execute store result storage zbk:temp hl_fl.sx int 1 run scoreboard players get #cd_storage_x global
execute store result storage zbk:temp hl_fl.sz int 1 run scoreboard players get #cd_storage_z global
execute store result storage zbk:temp hl_fl.ex int 1 run scoreboard players get #cd_storage_end_x global
execute store result storage zbk:temp hl_fl.ez int 1 run scoreboard players get #cd_storage_end_z global
function zbk:map_elements/custom_door/build_kit/door/highlight/forceload_add with storage zbk:temp hl_fl

# === Check volume before scanning (safety cap at 1000 blocks) ===
scoreboard players operation #cd_size_x global = #cd_max_x global
scoreboard players operation #cd_size_x global -= #cd_min_x global
scoreboard players add #cd_size_x global 1
scoreboard players operation #cd_size_y global = #cd_max_y global
scoreboard players operation #cd_size_y global -= #cd_min_y global
scoreboard players add #cd_size_y global 1
scoreboard players operation #cd_size_z global = #cd_max_z global
scoreboard players operation #cd_size_z global -= #cd_min_z global
scoreboard players add #cd_size_z global 1
scoreboard players operation #cd_volume global = #cd_size_x global
scoreboard players operation #cd_volume global *= #cd_size_y global
scoreboard players operation #cd_volume global *= #cd_size_z global
execute if score #cd_volume global matches 1001.. run return 0

# === Scan zone and summon magma cubes at saved non-air blocks ===
scoreboard players operation #cd_loop_y global = #cd_min_y global
function zbk:map_elements/custom_door/build_kit/door/highlight/scan_y

# Remove forceload
function zbk:map_elements/custom_door/build_kit/door/highlight/forceload_remove with storage zbk:temp hl_fl
