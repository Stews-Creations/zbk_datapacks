# === CUSTOM DOOR FLOAT - SETUP ===
# Runs as Corner 1 with custom_door_float=1. Tags BDs and summons center marker.

# Get door ID, skip if unlinked
execute store result score #cd_float_id global run scoreboard players get @s custom_door_id
execute if score #cd_float_id global matches 0 run return 0

# Check saved_zone exists
execute unless data entity @s data.saved_zone run return 0

# Remove orphaned/uninitialized emitters and this door's existing emitter before creating a fresh one.
execute as @e[type=marker,tag=cd_float_center,tag=!cd_float_initialized] run kill @s
execute as @e[type=marker,tag=cd_float_center] if score @s custom_door_id = #cd_float_id global run kill @s

# Read zone bounds from saved_zone
execute store result score #cd_min_x global run data get entity @s data.saved_zone.min_x
execute store result score #cd_min_y global run data get entity @s data.saved_zone.min_y
execute store result score #cd_min_z global run data get entity @s data.saved_zone.min_z
execute store result score #cd_max_x global run data get entity @s data.saved_zone.max_x
execute store result score #cd_max_y global run data get entity @s data.saved_zone.max_y
execute store result score #cd_max_z global run data get entity @s data.saved_zone.max_z

# Compute zone center: (min + max) / 2
scoreboard players operation #cd_center_x global = #cd_min_x global
scoreboard players operation #cd_center_x global += #cd_max_x global
scoreboard players set #cd_const global 2
scoreboard players operation #cd_center_x global /= #cd_const global

scoreboard players operation #cd_center_y global = #cd_min_y global
scoreboard players operation #cd_center_y global += #cd_max_y global
scoreboard players operation #cd_center_y global /= #cd_const global

scoreboard players operation #cd_center_z global = #cd_min_z global
scoreboard players operation #cd_center_z global += #cd_max_z global
scoreboard players operation #cd_center_z global /= #cd_const global

# Compute half-size spread: (max - min + 1) / 2
scoreboard players operation #cd_spread_x global = #cd_max_x global
scoreboard players operation #cd_spread_x global -= #cd_min_x global
scoreboard players add #cd_spread_x global 1
scoreboard players operation #cd_spread_x global /= #cd_const global

scoreboard players operation #cd_spread_y global = #cd_max_y global
scoreboard players operation #cd_spread_y global -= #cd_min_y global
scoreboard players add #cd_spread_y global 1
scoreboard players operation #cd_spread_y global /= #cd_const global

scoreboard players operation #cd_spread_z global = #cd_max_z global
scoreboard players operation #cd_spread_z global -= #cd_min_z global
scoreboard players add #cd_spread_z global 1
scoreboard players operation #cd_spread_z global /= #cd_const global

# Compute dx/dy/dz for BD tagging (zone size)
scoreboard players operation #cd_size_x global = #cd_max_x global
scoreboard players operation #cd_size_x global -= #cd_min_x global
scoreboard players add #cd_size_x global 1

scoreboard players operation #cd_size_y global = #cd_max_y global
scoreboard players operation #cd_size_y global -= #cd_min_y global
scoreboard players add #cd_size_y global 1

scoreboard players operation #cd_size_z global = #cd_max_z global
scoreboard players operation #cd_size_z global -= #cd_min_z global
scoreboard players add #cd_size_z global 1

# Store all values for macro
execute store result storage zombies:temp float_setup.min_x int 1 run scoreboard players get #cd_min_x global
execute store result storage zombies:temp float_setup.min_y int 1 run scoreboard players get #cd_min_y global
execute store result storage zombies:temp float_setup.min_z int 1 run scoreboard players get #cd_min_z global
execute store result storage zombies:temp float_setup.dx int 1 run scoreboard players get #cd_size_x global
execute store result storage zombies:temp float_setup.dy int 1 run scoreboard players get #cd_size_y global
execute store result storage zombies:temp float_setup.dz int 1 run scoreboard players get #cd_size_z global
execute store result storage zombies:temp float_setup.center_x int 1 run scoreboard players get #cd_center_x global
execute store result storage zombies:temp float_setup.center_y int 1 run scoreboard players get #cd_center_y global
execute store result storage zombies:temp float_setup.center_z int 1 run scoreboard players get #cd_center_z global
execute store result storage zombies:temp float_setup.spread_x int 1 run scoreboard players get #cd_spread_x global
execute store result storage zombies:temp float_setup.spread_y int 1 run scoreboard players get #cd_spread_y global
execute store result storage zombies:temp float_setup.spread_z int 1 run scoreboard players get #cd_spread_z global

# Execute macro to tag BDs and summon center marker
function zombies:map_elements/custom_door/float/setup_execute with storage zombies:temp float_setup

# Store original position on each BD/ID before float drift can accumulate
# Only set if not already stored (prevents overwriting with drifted position on re-setup)
execute as @e[type=block_display,tag=cd_float_bd] unless data entity @s data.float_origin run data modify entity @s data.float_origin set from entity @s Pos
execute as @e[type=item_display,tag=cd_float_id] unless data entity @s data.float_origin run data modify entity @s data.float_origin set from entity @s Pos

# Copy door ID score to the newly summoned center marker
scoreboard players operation @e[type=marker,tag=cd_float_center,tag=!cd_float_initialized,limit=1] custom_door_id = @s custom_door_id
tag @e[type=marker,tag=cd_float_center,tag=!cd_float_initialized,limit=1] add cd_float_initialized
