# === OPEN ZONE UNLOCKED CONFIG DIALOG ===
# Reads current zone from marker data, then opens macro dialog

# Get current zone from the tagged marker
execute store result score #signal_zone global run data get entity @e[tag=open_dialog,limit=1,sort=nearest] data.zone

# Remove tag
tag @e[tag=open_dialog,limit=1,sort=nearest] remove open_dialog

# Store data for macro function
data modify storage zbk:temp signal_dialog set value {current_zone:0}
execute store result storage zbk:temp signal_dialog.current_zone int 1 run scoreboard players get #signal_zone global

# Call macro function
function zbk:map_elements/game_signals/build_kit/dialogs/show_zone_unlocked_dialog with storage zbk:temp signal_dialog
