# === APPLY CUSTOM DOOR ANIMATION STYLE ===
# Macro function - receives style as parameter (1=Up, 2=Down, 3=Disappear)

# Store the style value in scoreboard
$scoreboard players set #selected_anim global $(style)

# Get the link ID from the nearest custom_door marker
execute as @p at @s run scoreboard players operation #cd_link_id global = @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] custom_door_id

# Apply to ALL custom_door markers with matching link ID (syncs both corners)
execute as @e[type=marker,tag=custom_door] if score @s custom_door_id = #cd_link_id global run scoreboard players operation @s custom_door_anim = #selected_anim global

# Feedback to player
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Animation set to ","color":"green"},{"text":"$(style)","color":"aqua","bold":true},{"text":" (1=Up, 2=Down, 3=Disappear)","color":"dark_gray"}]
