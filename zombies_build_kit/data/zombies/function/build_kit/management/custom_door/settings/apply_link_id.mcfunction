# === APPLY CUSTOM DOOR LINK ID ===
# Macro function - receives ID as parameter

# Store the ID value in scoreboard
$scoreboard players set #selected_id global $(id)

# Tag nearest marker so we can exclude it from the duplicate check
execute as @p at @s run tag @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] add cd_id_self

# Check if this ID (non-zero) already has 2 markers using it (excluding the marker we're setting)
scoreboard players set #cd_id_existing global 0
execute unless score #selected_id global matches 0 as @e[type=marker,tag=custom_door,tag=!cd_id_self] if score @s custom_door_id = #selected_id global run scoreboard players add #cd_id_existing global 1
execute if score #cd_id_existing global matches 2.. run tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Cannot assign ID ","color":"red"},{"score":{"name":"#selected_id","objective":"global"},"color":"yellow"},{"text":"! That ID is already used by 2 markers. Use a different ID.","color":"red"}]
execute if score #cd_id_existing global matches 2.. run tag @e[tag=cd_id_self] remove cd_id_self
execute if score #cd_id_existing global matches 2.. run function zombies:build_kit/management/custom_door/dialogs/open_config_dialog_refresh
execute if score #cd_id_existing global matches 2.. run return 0

# Assign the ID
scoreboard players operation @e[tag=cd_id_self] custom_door_id = #selected_id global
tag @e[tag=cd_id_self] remove cd_id_self

# Feedback to player
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Link ID set to ","color":"green"},{"text":"$(id)","color":"yellow","bold":true}]

# Reopen the dialog to reflect updated values
function zombies:build_kit/management/custom_door/dialogs/open_config_dialog_refresh
