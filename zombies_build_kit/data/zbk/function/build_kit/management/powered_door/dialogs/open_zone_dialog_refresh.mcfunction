# === REFRESH POWERED DOOR ZONE DIALOG ===
# Re-opens the powered door zone dialog with updated values
# This is called after applying changes to keep the dialog open

# Tag the nearest powered door marker
execute at @s run tag @e[type=marker,tag=door_powered,distance=..5,limit=1,sort=nearest] add open_dialog

# Open the dialog
function zbk:build_kit/management/powered_door/dialogs/open_zone_dialog
