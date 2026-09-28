# ===================================
# CUSTOM DOOR - KILL SIGN UI
# ===================================
# Runs as a sign marker. Kills its linked text_display and interaction by cd_sign_uid match.
# Called from: buy/open

# Mark this sign as purchased
tag @s add purchased

# Store this sign's UID for matching
scoreboard players operation #cd_temp_uid global = @s cd_sign_uid

# Kill only UI entities with matching UID (no distance-based kill)
execute as @e[type=text_display,tag=custom_door_sign_ui] if score @s cd_sign_uid = #cd_temp_uid global run kill @s
execute as @e[type=interaction,tag=custom_door_sign_interaction] if score @s cd_sign_uid = #cd_temp_uid global run kill @s
