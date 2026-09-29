# === REFRESH DOOR CONFIG DIALOG ===
# Re-opens the door config dialog with updated values
# This is called after applying changes to keep the dialog open

# Tag the nearest door marker
execute at @s run tag @e[type=marker,tag=door,distance=..5,limit=1,sort=nearest] add open_dialog

# Open the dialog
function zbk:map_elements/door/build_kit/purchasable/dialogs/open_config_dialog
