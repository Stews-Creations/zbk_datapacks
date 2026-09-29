# === TOGGLE MYSTERY BOX SPAWN LOCATION ===
# Called from dialog button - toggles spawn location status and reopens dialog

# Find nearest mystery box location marker
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run function zbk:map_elements/mystery_box/build_kit/settings/toggle_spawn_location_execute

# Reopen the dialog with updated status
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run tag @s add open_dialog
function zbk:map_elements/mystery_box/build_kit/dialogs/open_dialog
