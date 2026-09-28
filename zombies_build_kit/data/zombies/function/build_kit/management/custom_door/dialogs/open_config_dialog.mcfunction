# === OPEN CUSTOM DOOR CONFIG DIALOG ===
# Reads link ID and marker type, then opens macro dialog

# Get current link ID (default 0 = unlinked)
scoreboard players set #current_id global 0
execute if entity @e[tag=open_dialog,limit=1,sort=nearest] store result score #current_id global run scoreboard players get @e[tag=open_dialog,limit=1,sort=nearest] custom_door_id

# Get current animation style (default 3 = Disappear)
scoreboard players set #current_anim global 3
execute if entity @e[tag=open_dialog,limit=1,sort=nearest] store result score #current_anim global run scoreboard players get @e[tag=open_dialog,limit=1,sort=nearest] custom_door_anim
execute if score #current_anim global matches ..0 run scoreboard players set #current_anim global 3

# Get current animation speed (default 4 ticks/layer)
scoreboard players set #current_speed global 4
execute if entity @e[tag=open_dialog,limit=1,sort=nearest] store result score #current_speed global run scoreboard players get @e[tag=open_dialog,limit=1,sort=nearest] custom_door_speed
execute if score #current_speed global matches ..0 run scoreboard players set #current_speed global 4

# Detect marker type
data modify storage zombies:temp custom_door_dialog set value {current_id:0,marker_type:"Unknown",current_anim:3,current_speed:4,current_float_label:"OFF",current_power_label:"OFF",used_ids:"None"}
execute if entity @e[tag=open_dialog,tag=custom_door_1,limit=1,sort=nearest] run data modify storage zombies:temp custom_door_dialog.marker_type set value "Corner 1"
execute if entity @e[tag=open_dialog,tag=custom_door_2,limit=1,sort=nearest] run data modify storage zombies:temp custom_door_dialog.marker_type set value "Corner 2"

# Get float setting (default OFF, stored on Corner 1)
# If Corner 1: read directly
execute if entity @e[tag=open_dialog,tag=custom_door_1,limit=1,sort=nearest] if score @e[tag=open_dialog,tag=custom_door_1,limit=1,sort=nearest] custom_door_float matches 1 run data modify storage zombies:temp custom_door_dialog.current_float_label set value "ON"
# If Corner 2: find linked Corner 1 by ID
execute if entity @e[tag=open_dialog,tag=custom_door_2,limit=1,sort=nearest] as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #current_id global if score @s custom_door_float matches 1 run data modify storage zombies:temp custom_door_dialog.current_float_label set value "ON"

# Get power door setting (default OFF, stored on Corner 1)
# If Corner 1: read directly
execute if entity @e[tag=open_dialog,tag=custom_door_1,limit=1,sort=nearest] if score @e[tag=open_dialog,tag=custom_door_1,limit=1,sort=nearest] custom_door_power matches 1 run data modify storage zombies:temp custom_door_dialog.current_power_label set value "ON"
# If Corner 2: find linked Corner 1 by ID
execute if entity @e[tag=open_dialog,tag=custom_door_2,limit=1,sort=nearest] as @e[type=marker,tag=custom_door_1] if score @s custom_door_id = #current_id global if score @s custom_door_power matches 1 run data modify storage zombies:temp custom_door_dialog.current_power_label set value "ON"

# Store ID, animation, and speed
execute store result storage zombies:temp custom_door_dialog.current_id int 1 run scoreboard players get #current_id global
execute store result storage zombies:temp custom_door_dialog.current_anim int 1 run scoreboard players get #current_anim global
execute store result storage zombies:temp custom_door_dialog.current_speed int 1 run scoreboard players get #current_speed global

# Remove tag
tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

# Scan all custom door markers for used IDs (result stored in zombies:temp used_ids_string)
function zombies:build_kit/management/custom_door/scan_used_ids
data modify storage zombies:temp custom_door_dialog.used_ids set from storage zombies:temp used_ids_string

# Call macro function with storage data
function zombies:build_kit/management/custom_door/dialogs/show_config_dialog with storage zombies:temp custom_door_dialog
