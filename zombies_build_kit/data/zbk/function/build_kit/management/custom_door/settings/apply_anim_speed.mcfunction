# === APPLY CUSTOM DOOR ANIMATION SPEED ===
# Macro function - receives speed as parameter (1-10 ticks per layer)

# Store the speed value in scoreboard
$scoreboard players set #selected_speed global $(speed)

# Get the link ID from the nearest custom_door marker
execute as @p at @s run scoreboard players operation #cd_link_id global = @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] custom_door_id

# Apply to ALL custom_door markers with matching link ID (syncs both corners)
execute as @e[type=marker,tag=custom_door] if score @s custom_door_id = #cd_link_id global run scoreboard players operation @s custom_door_speed = #selected_speed global

# Feedback to player
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Animation speed set to ","color":"green"},{"text":"$(speed)","color":"aqua","bold":true},{"text":" ticks/layer (lower = faster)","color":"dark_gray"}]
