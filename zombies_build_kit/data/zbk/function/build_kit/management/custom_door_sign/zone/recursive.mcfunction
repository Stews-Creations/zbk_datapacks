# === REMOVE ZONE RECURSIVE (SIGN) ===
# Recursively removes all instances of #zone_to_remove from the zones array

# Try to match and remove from position 0
execute store result score #current_zone global run data get storage zbk:temp old_zones[0]
execute unless data storage zbk:temp old_zones[0] run return 0

# If this zone matches the target, skip it. Otherwise, add it to new_zones
execute unless score #current_zone global = #zone_to_remove global run data modify storage zbk:temp new_zones append from storage zbk:temp old_zones[0]

# Remove first element and recurse
data remove storage zbk:temp old_zones[0]
function zbk:build_kit/management/custom_door_sign/zone/recursive
