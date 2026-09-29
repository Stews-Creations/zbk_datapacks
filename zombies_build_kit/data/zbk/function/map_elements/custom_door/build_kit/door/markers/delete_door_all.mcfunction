# === DELETE FULL DOOR (REMOVE BLOCKS & DISPLAYS) ===
# Removes ALL entities associated with the door, fills zone with air, kills block displays

# Get the door ID from the nearest custom_door marker
execute at @s run scoreboard players operation #cd_delete_id custom_door_id = @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] custom_door_id

# Validate ID is not 0 (unlinked)
execute if score #cd_delete_id custom_door_id matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Cannot delete door: marker has no Link ID (0). Assign an ID first or use single Delete.","color":"red"}]
execute if score #cd_delete_id custom_door_id matches 0 run return 0

# === FILL ZONE WITH AIR + KILL BLOCK DISPLAYS ===
# Find Corner 1 with saved zone data
execute as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #cd_delete_id custom_door_id run tag @s add cd_delete_corner
execute unless entity @e[tag=cd_delete_corner] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Warning: No Corner 1 found, cannot remove blocks. Removing entities only.","color":"yellow"}]

# Read zone bounds into scoreboards (only if Corner 1 has saved zone data)
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result score #cd_min_x global run data get entity @e[tag=cd_delete_corner,limit=1] data.saved_zone.min_x
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result score #cd_min_y global run data get entity @e[tag=cd_delete_corner,limit=1] data.saved_zone.min_y
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result score #cd_min_z global run data get entity @e[tag=cd_delete_corner,limit=1] data.saved_zone.min_z
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result score #cd_max_x global run data get entity @e[tag=cd_delete_corner,limit=1] data.saved_zone.max_x
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result score #cd_max_y global run data get entity @e[tag=cd_delete_corner,limit=1] data.saved_zone.max_y
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result score #cd_max_z global run data get entity @e[tag=cd_delete_corner,limit=1] data.saved_zone.max_z

# Fill zone with air
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp fill_air.min_x int 1 run scoreboard players get #cd_min_x global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp fill_air.min_y int 1 run scoreboard players get #cd_min_y global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp fill_air.min_z int 1 run scoreboard players get #cd_min_z global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp fill_air.max_x int 1 run scoreboard players get #cd_max_x global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp fill_air.max_y int 1 run scoreboard players get #cd_max_y global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp fill_air.max_z int 1 run scoreboard players get #cd_max_z global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run function zbk:map_elements/custom_door/animations/clearing/fill_air with storage zbk:temp fill_air

# Kill ALL block_displays in zone by position (they may not have tags/scores)
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players operation #cd_size_x global = #cd_max_x global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players operation #cd_size_x global -= #cd_min_x global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players add #cd_size_x global 1
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players operation #cd_size_y global = #cd_max_y global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players operation #cd_size_y global -= #cd_min_y global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players add #cd_size_y global 1
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players operation #cd_size_z global = #cd_max_z global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players operation #cd_size_z global -= #cd_min_z global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run scoreboard players add #cd_size_z global 1
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp del_bd.min_x int 1 run scoreboard players get #cd_min_x global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp del_bd.min_y int 1 run scoreboard players get #cd_min_y global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp del_bd.min_z int 1 run scoreboard players get #cd_min_z global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp del_bd.dx int 1 run scoreboard players get #cd_size_x global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp del_bd.dy int 1 run scoreboard players get #cd_size_y global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run execute store result storage zbk:temp del_bd.dz int 1 run scoreboard players get #cd_size_z global
execute if entity @e[tag=cd_delete_corner] if data entity @e[tag=cd_delete_corner,limit=1] data.saved_zone run function zbk:map_elements/custom_door/build_kit/door/markers/delete_zone_bd with storage zbk:temp del_bd

# Cleanup temp tag
tag @e[tag=cd_delete_corner] remove cd_delete_corner

# === KILL ALL ENTITIES ===

# Tag corner markers with matching door ID
execute as @e[tag=custom_door] if score @s custom_door_id = #cd_delete_id custom_door_id run tag @s add cd_delete

# Tag sign markers with matching door ID, and kill their nearby UI/interaction (which have no score)
execute as @e[tag=custom_door_sign] if score @s custom_door_id = #cd_delete_id custom_door_id at @s run kill @e[type=text_display,tag=custom_door_sign_ui,distance=..5]
execute as @e[tag=custom_door_sign] if score @s custom_door_id = #cd_delete_id custom_door_id at @s run kill @e[type=interaction,tag=custom_door_sign_interaction,distance=..5]
execute as @e[tag=custom_door_sign] if score @s custom_door_id = #cd_delete_id custom_door_id run tag @s add cd_delete

# TP highlight cubes to void first (prevents splitting/loot), then kill
execute as @e[type=magma_cube,tag=cd_highlight_cube] if score @s custom_door_id = #cd_delete_id custom_door_id run tp @s ~ -10000 ~
execute as @e[type=magma_cube,tag=cd_highlight_cube] if score @s custom_door_id = #cd_delete_id custom_door_id run kill @s

# Tag float centers with matching door ID
execute as @e[tag=cd_float_center] if score @s custom_door_id = #cd_delete_id custom_door_id run tag @s add cd_delete

# Kill all tagged entities
kill @e[tag=cd_delete]

tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Door fully deleted (blocks + displays removed). ID: ","color":"green"},{"score":{"name":"#cd_delete_id","objective":"custom_door_id"},"color":"yellow"}]
