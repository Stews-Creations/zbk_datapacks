# === TOGGLE MYSTERY BOX SPAWN LOCATION ===
# Called from dialog button - toggles spawn location status and reopens dialog

# Find nearest mystery box location marker
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run function zbk:build_kit/management/mystery_box/toggle_spawn_location_execute

# Reopen the dialog with updated status
execute as @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] run tag @s add open_dialog
function zbk:build_kit/management/mystery_box/dialogs/open_dialog
