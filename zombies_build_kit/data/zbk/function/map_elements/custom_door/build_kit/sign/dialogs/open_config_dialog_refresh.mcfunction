# === REFRESH CUSTOM DOOR SIGN CONFIG DIALOG ===
# Re-tags nearest marker and reopens dialog (used after applying changes)

execute as @p at @s run tag @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] add open_dialog
function zbk:map_elements/custom_door/build_kit/sign/dialogs/open_config_dialog
