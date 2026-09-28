# === APPLY CUSTOM DOOR SIGN ADD ZONE ===
# Macro function - receives zone number to add
# Adds zone to ALL signs with the same link ID

# Store the zone value
$scoreboard players set #selected_zone global $(zone)

# Get the link ID of the nearest sign
execute as @p at @s store result score #cd_sign_link global run scoreboard players get @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] custom_door_id

# Initialize zones array and append zone on all matching signs
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #cd_sign_link global unless data entity @s data.zones run data modify entity @s data.zones set value []
$execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #cd_sign_link global run data modify entity @s data.zones append value $(zone)

# Feedback to player
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Added Zone ","color":"green"},{"text":"$(zone)","color":"yellow","bold":true},{"text":" to all linked signs","color":"green"}]
