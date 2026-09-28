# === REFRESH CUSTOM DOOR CONFIG DIALOG ===
# Re-tags nearest marker and reopens dialog (used after applying changes)

execute as @p at @s run tag @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] add open_dialog
function zbk:build_kit/management/custom_door/dialogs/open_config_dialog
