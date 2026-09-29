# === REFRESH WALL GUN CONFIG DIALOG ===
# Re-opens the wall gun config dialog with updated values
# This is called after applying changes to keep the dialog open

# Tag the nearest wall gun marker
execute at @s run tag @e[type=marker,tag=wall_gun,distance=..5,limit=1,sort=nearest] add open_dialog

# Open the dialog
function zbk:map_elements/wall_gun/build_kit/dialogs/open_config_dialog
