# === OPEN CUSTOM DOOR SIGN CONFIG DIALOG ===
# Reads link ID, price, and zones from sign marker

# Get current link ID (default 0)
scoreboard players set #current_id global 0
execute if entity @e[tag=open_dialog,limit=1,sort=nearest] store result score #current_id global run scoreboard players get @e[tag=open_dialog,limit=1,sort=nearest] custom_door_id

# Get current price (default 0)
scoreboard players set #current_price global 0
execute if entity @e[tag=open_dialog,limit=1,sort=nearest] store result score #current_price global run data get entity @e[tag=open_dialog,limit=1,sort=nearest] data.name 1

# Get zones array
data modify storage zbk:temp cd_sign_zones set from entity @e[tag=open_dialog,limit=1,sort=nearest] data.zones

# Get linked_doors array
data modify storage zbk:temp cd_sign_linked_doors set from entity @e[tag=open_dialog,limit=1,sort=nearest] data.linked_doors

# Store data for macro
data modify storage zbk:temp cd_sign_dialog set value {current_id:0,current_price:0,zones:"[]",linked_doors:"[]",used_ids:"None"}
execute store result storage zbk:temp cd_sign_dialog.current_id int 1 run scoreboard players get #current_id global
execute store result storage zbk:temp cd_sign_dialog.current_price int 1 run scoreboard players get #current_price global
data modify storage zbk:temp cd_sign_dialog.zones set from storage zbk:temp cd_sign_zones
data modify storage zbk:temp cd_sign_dialog.linked_doors set from storage zbk:temp cd_sign_linked_doors

# Remove tag
tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

# Scan all custom door markers for used IDs (result stored in zbk:temp used_ids_string)
function zbk:build_kit/management/custom_door/scan_used_ids
data modify storage zbk:temp cd_sign_dialog.used_ids set from storage zbk:temp used_ids_string

# Call macro dialog
function zbk:build_kit/management/custom_door_sign/dialogs/show_config_dialog with storage zbk:temp cd_sign_dialog
