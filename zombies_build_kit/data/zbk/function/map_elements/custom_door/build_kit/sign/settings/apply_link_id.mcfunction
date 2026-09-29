# === APPLY CUSTOM DOOR SIGN LINK ID ===
# Macro function - receives ID as parameter

# Store the ID value in scoreboard
$scoreboard players set #selected_id global $(id)

# Find the nearest custom_door_sign marker and assign the ID
execute as @p at @s if entity @e[type=marker,tag=custom_door_sign,distance=..5,limit=1] run scoreboard players operation @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] custom_door_id = #selected_id global

# Update display (handles power door state — removes interaction/text if power door)
execute as @p at @s as @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] at @s run function zbk:map_elements/custom_door/management/update_display

# Feedback to player
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Sign Link ID set to ","color":"green"},{"text":"$(id)","color":"yellow","bold":true}]

# Reopen the dialog to reflect updated values
function zbk:map_elements/custom_door/build_kit/sign/dialogs/open_config_dialog_refresh
