# === SCAN TELEPORTER USED IDS ===
# Collects all unique teleporter_id values (>=1) into a comma-separated string
# Result stored in zbk:temp used_ids_string

# Tag all teleporter markers that have an assigned ID
tag @e[type=marker,tag=teleporter,scores={teleporter_id=1..}] add id_scan

# Initialize defaults
data modify storage zbk:temp used_ids_string set value "None"
scoreboard players set #id_scan_count global 0

# Build the string if any IDs exist
execute if entity @e[type=marker,tag=id_scan] run function zbk:map_elements/teleporter/build_kit/links/scan_next_id

# Safety cleanup
tag @e[tag=id_scan] remove id_scan
