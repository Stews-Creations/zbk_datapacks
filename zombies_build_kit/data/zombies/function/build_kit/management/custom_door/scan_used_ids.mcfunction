# === SCAN CUSTOM DOOR USED IDS ===
# Collects all unique custom_door_id values (>=1) into a comma-separated string
# Result stored in zombies:temp used_ids_string

# Tag all custom door markers that have an assigned ID (corners and signs share the same ID space)
tag @e[type=marker,tag=custom_door,scores={custom_door_id=1..}] add id_scan
tag @e[type=marker,tag=custom_door_sign,scores={custom_door_id=1..}] add id_scan

# Initialize defaults
data modify storage zombies:temp used_ids_string set value "None"
scoreboard players set #id_scan_count global 0

# Build the string if any IDs exist
execute if entity @e[type=marker,tag=id_scan] run function zombies:build_kit/management/custom_door/scan_next_id

# Safety cleanup (should already be empty after recursion)
tag @e[tag=id_scan] remove id_scan
