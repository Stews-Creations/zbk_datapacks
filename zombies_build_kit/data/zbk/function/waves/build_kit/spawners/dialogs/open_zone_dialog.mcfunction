# === OPEN SPAWNER ZONE DIALOG ===
# Macro function - receives spawner_type as parameter
# Opens dialog with current zone displayed

# Get current zone from the tagged spawner.
scoreboard players set #current_zone global 0
execute store result score #current_zone global run data get entity @e[tag=open_dialog,limit=1,sort=nearest] data.zone

# Store data for macro function
$data modify storage zbk:temp zone_dialog set value {spawner_type:"$(spawner_type)",spawner_tag:"$(spawner_tag)",current_zone:0}
execute store result storage zbk:temp zone_dialog.current_zone int 1 run scoreboard players get #current_zone global
tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

# Call macro function with storage data
function zbk:waves/build_kit/spawners/dialogs/show_zone_dialog with storage zbk:temp zone_dialog
