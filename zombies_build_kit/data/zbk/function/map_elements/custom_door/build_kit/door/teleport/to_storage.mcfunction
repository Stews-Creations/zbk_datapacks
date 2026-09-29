# === TP TO DOOR STORAGE DIMENSION ===
# Teleports player to the saved door zone in zbk:door_storage

# Find nearest custom_door marker
execute at @s unless entity @e[type=marker,tag=custom_door,distance=..5,limit=1] run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"No custom door marker nearby","color":"red"}]
execute at @s unless entity @e[type=marker,tag=custom_door,distance=..5,limit=1] run return 0

# Tag nearest marker
execute at @s run tag @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] add cd_tp_self

# Get link ID
execute store result score #cd_tp_id global run scoreboard players get @e[tag=cd_tp_self,limit=1] custom_door_id

# Check if ID is 0 (unlinked)
execute if score #cd_tp_id global matches 0 run tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Marker has no Link ID assigned","color":"red"}]
execute if score #cd_tp_id global matches 0 run tag @e[tag=cd_tp_self] remove cd_tp_self
execute if score #cd_tp_id global matches 0 run return 0

# Compute storage X = id * 100
scoreboard players set #cd_const global 100
scoreboard players operation #cd_tp_x global = #cd_tp_id global
scoreboard players operation #cd_tp_x global *= #cd_const global

# Save player's current position for TP back
execute store result storage zbk:temp tp_back.x double 1 run data get entity @s Pos[0]
execute store result storage zbk:temp tp_back.y double 1 run data get entity @s Pos[1]
execute store result storage zbk:temp tp_back.z double 1 run data get entity @s Pos[2]

# Store storage coords for macro
execute store result storage zbk:temp tp_storage.x int 1 run scoreboard players get #cd_tp_x global

# TP to storage dimension
function zbk:map_elements/custom_door/build_kit/door/teleport/to_storage_execute with storage zbk:temp tp_storage

# Ensure creative mode + slow falling so they don't die from the fall
gamemode creative @s
effect give @s slow_falling infinite 0 true

# Success message
tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Teleported to door storage! ","color":"green"},{"text":"[TP Back]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"function zbk:map_elements/custom_door/build_kit/door/teleport/back"},"hover_event":{"action":"show_text","value":"Click to teleport back"}}]

# Cleanup
tag @e[tag=cd_tp_self] remove cd_tp_self
