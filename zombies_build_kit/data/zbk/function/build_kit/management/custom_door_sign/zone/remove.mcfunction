# === APPLY CUSTOM DOOR SIGN REMOVE ZONE ===
# Macro function - receives zone number to remove
# Removes zone from ALL signs with the same link ID

# Store the zone value
$scoreboard players set #selected_zone global $(zone)
$scoreboard players set #zone_to_remove global $(zone)

# Get the link ID of the nearest sign
execute as @p at @s store result score #cd_sign_link global run scoreboard players get @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] custom_door_id

# Process each matching sign
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #cd_sign_link global run function zbk:build_kit/management/custom_door_sign/zone/remove_from_sign

# Feedback to player
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Removed Zone ","color":"green"},{"text":"$(zone)","color":"yellow","bold":true},{"text":" from all linked signs","color":"green"}]
