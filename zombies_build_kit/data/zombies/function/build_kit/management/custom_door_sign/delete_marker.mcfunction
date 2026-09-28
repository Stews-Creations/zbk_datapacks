# === DELETE CUSTOM DOOR SIGN MARKER ===
# Kills the nearest custom_door_sign marker and its UI entities

# Get UID of nearest sign to only delete its linked entities
execute at @s store result score #cd_sign_uid global run scoreboard players get @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest] cd_sign_uid
execute at @s as @e[type=text_display,tag=custom_door_sign_ui,distance=..5] if score @s cd_sign_uid = #cd_sign_uid global run kill @s
execute at @s as @e[type=interaction,tag=custom_door_sign_interaction,distance=..5] if score @s cd_sign_uid = #cd_sign_uid global run kill @s
execute at @s run kill @e[type=marker,tag=custom_door_sign,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Manager] ","color":"gold"},{"text":"Custom door sign deleted","color":"green"}]
