# === SHIFT CUSTOM DOOR SIGN -0.5 ON Z AXIS ===
# Moves the sign marker and recreates UI entities

# Find nearest sign marker
execute as @p at @s run tag @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] add cd_shifting

# Kill old UI entities (matched by UID)
execute as @e[tag=cd_shifting,limit=1] store result score #cd_sign_uid global run scoreboard players get @s cd_sign_uid
execute as @e[type=text_display,tag=custom_door_sign_ui] if score @s cd_sign_uid = #cd_sign_uid global run kill @s
execute as @e[type=interaction,tag=custom_door_sign_interaction] if score @s cd_sign_uid = #cd_sign_uid global run kill @s

# Teleport marker -0.5 on Z
execute as @e[tag=cd_shifting,limit=1] at @s run tp @s ~ ~ ~-0.5

# Recreate UI
execute as @e[tag=cd_shifting,limit=1] at @s run function zombies:map_elements/custom_door/management/create_sign_ui

# Update text with current price
execute as @e[tag=cd_shifting,limit=1] at @s run function zombies:map_elements/custom_door/management/update_display

# Temporary green highlight
execute as @e[tag=cd_shifting,limit=1] at @s run function zombies:build_kit/management/custom_door_sign/settings/highlight_shift

# Remove tag
tag @e[tag=cd_shifting] remove cd_shifting

# Feedback
tellraw @p [{"text":"[Build Manager] ","color":"gold"},{"text":"Sign shifted -0.5 on Z axis","color":"green"}]
