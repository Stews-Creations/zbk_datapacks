# === APPLY CUSTOM DOOR ANIMATION (STYLE + SPEED) ===
# Macro function - receives style (1=Up, 2=Down, 3=Disappear) and speed (1-10 ticks/layer)

# Store values in scoreboards
$scoreboard players set #selected_anim global $(style)
$scoreboard players set #selected_speed global $(speed)

# Get the link ID from the nearest custom_door marker
execute as @p at @s run scoreboard players operation #cd_link_id global = @e[type=marker,tag=custom_door,distance=..5,limit=1,sort=nearest] custom_door_id

# Apply to ALL custom_door markers with matching link ID (syncs both corners)
execute as @e[type=marker,tag=custom_door] if score @s custom_door_id = #cd_link_id global run scoreboard players operation @s custom_door_anim = #selected_anim global
execute as @e[type=marker,tag=custom_door] if score @s custom_door_id = #cd_link_id global run scoreboard players operation @s custom_door_speed = #selected_speed global

# Feedback
$tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Animation set to style ","color":"green"},{"text":"$(style)","color":"aqua","bold":true},{"text":" at ","color":"green"},{"text":"$(speed)","color":"aqua","bold":true},{"text":" ticks/layer","color":"green"}]
