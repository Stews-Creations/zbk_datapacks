# === OPEN POWERED DOOR ZONE DIALOG ===
# Opens dialog with current powered door zones displayed

# Get zones array as string
data modify storage zbk:temp powered_door_zones set from entity @e[tag=open_dialog,limit=1,sort=nearest] data.zones

# Remove tag
tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

# Store data for macro function
data modify storage zbk:temp powered_door_dialog set value {zones:"[]"}
data modify storage zbk:temp powered_door_dialog.zones set from storage zbk:temp powered_door_zones

# Call macro function with storage data
function zbk:map_elements/door/build_kit/powered/dialogs/show_zone_dialog with storage zbk:temp powered_door_dialog
