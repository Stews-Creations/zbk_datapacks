# ===================================
# CUSTOM DOOR - OPEN
# ===================================
# Runs as the sign marker. Handles shared open logic then routes by animation style.
# Called from: buy/buy, management/power_open

# Get this sign's link ID
execute store result score #cd_sign_id global run scoreboard players get @s custom_door_id

# Stop floating effect for this door (if active)
function zbk:map_elements/custom_door/float/cleanup

# === SHARED LOGIC: Mark purchased + kill UI + effects ===

# Tag ALL signs with matching link ID as purchased, kill their UI (by UID match, not distance)
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #cd_sign_id global run function zbk:map_elements/custom_door/buy/kill_sign_ui

# Visual effects
particle minecraft:cloud ~ ~2 ~ 1 1 1 0.2 50 force
particle minecraft:poof ~ ~2 ~ 1 1 1 0.1 30 force

# Sound effects
playsound minecraft:block.iron_door.open master @a ~ ~ ~ 2 0.5
playsound minecraft:block.piston.extend master @a ~ ~ ~ 2 0.8

# === ROUTE BY ANIMATION STYLE ===

# Find Corner 1 with matching link ID to check animation style
execute as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_sign_id global run tag @s add cd_sign_corner

# Read animation style from corner (default 3 = disappear)
scoreboard players set #cd_anim_style global 3
execute if entity @e[tag=cd_sign_corner] store result score #cd_anim_style global run scoreboard players get @e[tag=cd_sign_corner,limit=1] custom_door_anim
tag @e[tag=cd_sign_corner] remove cd_sign_corner

# If animated (1=Up, 2=Down), delegate to open_animated
execute if score #cd_anim_style global matches 1..2 run function zbk:map_elements/custom_door/buy/open_animated
execute if score #cd_anim_style global matches 1..2 run return 0

# === DISAPPEAR (style 3) — instant fill with air ===

# Find Corner 1 again for zone data
execute as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_sign_id global run tag @s add cd_sign_corner

# Check if corner with saved data was found
execute unless entity @e[tag=cd_sign_corner] run return 0
execute unless data entity @e[tag=cd_sign_corner,limit=1] data.saved_zone run tag @e[tag=cd_sign_corner] remove cd_sign_corner
execute unless entity @e[tag=cd_sign_corner] run return 0

# Read zone bounds from Corner 1
execute store result score #cd_min_x global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.min_x
execute store result score #cd_min_y global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.min_y
execute store result score #cd_min_z global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.min_z
execute store result score #cd_max_x global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.max_x
execute store result score #cd_max_y global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.max_y
execute store result score #cd_max_z global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.max_z

# === Selective fill: only set to air where saved block is non-air ===
# Get storage coordinates from saved zone
execute store result score #cd_storage_x global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.storage_x
execute store result score #cd_storage_y global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.storage_y
execute store result score #cd_storage_z global run data get entity @e[tag=cd_sign_corner,limit=1] data.saved_zone.storage_z

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
execute store result storage zbk:temp fa_fl.sx int 1 run scoreboard players get #cd_storage_x global
execute store result storage zbk:temp fa_fl.sz int 1 run scoreboard players get #cd_storage_z global
execute store result storage zbk:temp fa_fl.ex int 1 run scoreboard players get #cd_storage_end_x global
execute store result storage zbk:temp fa_fl.ez int 1 run scoreboard players get #cd_storage_end_z global
function zbk:map_elements/custom_door/build_kit/door/highlight/forceload_add with storage zbk:temp fa_fl

# Scan zone block-by-block, only setting to air where storage has a non-air block
scoreboard players operation #cd_loop_y global = #cd_min_y global
function zbk:map_elements/custom_door/animations/clearing/fill_air_scan_y

# Remove forceload
function zbk:map_elements/custom_door/build_kit/door/highlight/forceload_remove with storage zbk:temp fa_fl

# Tag and kill block_displays in zone
scoreboard players operation #cd_size_x global = #cd_max_x global
scoreboard players operation #cd_size_x global -= #cd_min_x global
scoreboard players add #cd_size_x global 1
scoreboard players operation #cd_size_y global = #cd_max_y global
scoreboard players operation #cd_size_y global -= #cd_min_y global
scoreboard players add #cd_size_y global 1
scoreboard players operation #cd_size_z global = #cd_max_z global
scoreboard players operation #cd_size_z global -= #cd_min_z global
scoreboard players add #cd_size_z global 1
execute store result storage zbk:temp bd_anim.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zbk:temp bd_anim.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zbk:temp bd_anim.min_z int 1 run scoreboard players get #cd_min_z global
execute store result storage zbk:temp bd_anim.dx int 1 run scoreboard players get #cd_size_x global
execute store result storage zbk:temp bd_anim.dy int 1 run scoreboard players get #cd_size_y global
execute store result storage zbk:temp bd_anim.dz int 1 run scoreboard players get #cd_size_z global
execute store result storage zbk:temp bd_anim.door_id int 1 run scoreboard players get #cd_sign_id global
function zbk:map_elements/custom_door/animations/layers/tag_block_displays with storage zbk:temp bd_anim

# Kill tagged block_displays and item_displays
execute as @e[type=block_display,tag=cd_anim_bd] if score @s custom_door_id = #cd_sign_id global run kill @s
execute as @e[type=block_display,tag=cd_door_bd] if score @s custom_door_id = #cd_sign_id global run kill @s
execute as @e[type=item_display,tag=cd_anim_id] if score @s custom_door_id = #cd_sign_id global run kill @s
execute as @e[type=item_display,tag=cd_door_id] if score @s custom_door_id = #cd_sign_id global run kill @s

# Unlock spawner zones
data modify storage zbk:temp unlock_zones set from entity @s data.zones
function zbk:map_elements/door/management/unlock_spawners_recursive

# Cleanup corner tag before linked doors (prevents tag collision in nested open calls)
tag @e[tag=cd_sign_corner] remove cd_sign_corner

# Open any linked doors (bidirectional - purchased check prevents loops)
function zbk:map_elements/custom_door/buy/open_linked_doors
