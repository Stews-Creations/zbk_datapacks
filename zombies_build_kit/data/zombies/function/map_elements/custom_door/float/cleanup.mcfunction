# === CUSTOM DOOR FLOAT - CLEANUP ===
# Removes floating effects for a specific door on purchase
# Expects: #cd_sign_id global = the door's link ID
# Runs positioned at the sign marker location

# Kill center marker for this door
execute as @e[type=marker,tag=cd_float_center] if score @s custom_door_id = #cd_sign_id global run kill @s

# Untag BDs and IDs (generous distance since they may have drifted +-0.5 blocks)
tag @e[type=block_display,tag=cd_float_bd,distance=..60] remove cd_float_bd
tag @e[type=item_display,tag=cd_float_id,distance=..60] remove cd_float_id
