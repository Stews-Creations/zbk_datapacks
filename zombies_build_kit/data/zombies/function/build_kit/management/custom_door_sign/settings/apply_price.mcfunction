# === APPLY CUSTOM DOOR SIGN PRICE ===
# Macro function - receives price as parameter
# Sets price on ALL signs with the same link ID

# Get the link ID of the nearest sign
execute as @p at @s store result score #cd_sign_link global run scoreboard players get @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] custom_door_id

# Set price on all signs with matching link ID
$execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #cd_sign_link global run data modify entity @s data.name set value $(price)

# Update displays on all matching signs
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #cd_sign_link global at @s run function zombies:map_elements/custom_door/management/update_display

# Feedback to player
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Price set to ","color":"green"},{"text":"$(price)","color":"yellow","bold":true},{"text":" on all linked signs","color":"green"}]
