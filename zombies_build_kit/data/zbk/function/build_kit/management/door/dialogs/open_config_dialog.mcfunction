# === OPEN DOOR CONFIG DIALOG ===
# Opens dialog with current door price and zones displayed

# Get current price from the tagged door
execute store result score #current_price global run data get entity @e[tag=open_dialog,limit=1,sort=nearest] data.name

# Get zones array as string
data modify storage zbk:temp door_zones set from entity @e[tag=open_dialog,limit=1,sort=nearest] data.zones

# Remove tag
tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

# Store data for macro function
data modify storage zbk:temp door_dialog set value {current_price:0,zones:"[]"}
execute store result storage zbk:temp door_dialog.current_price int 1 run scoreboard players get #current_price global
data modify storage zbk:temp door_dialog.zones set from storage zbk:temp door_zones

# Call macro function with storage data
function zbk:build_kit/management/door/dialogs/show_config_dialog with storage zbk:temp door_dialog
