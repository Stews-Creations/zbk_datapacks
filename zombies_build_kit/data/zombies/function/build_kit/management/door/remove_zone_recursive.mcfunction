# === REMOVE ZONE RECURSIVE ===
# Recursively removes all instances of #zone_to_remove from the zones array

# Try to match and remove from position 0
execute store result score #current_zone global run data get storage zombies:temp old_zones[0]
execute unless data storage zombies:temp old_zones[0] run return 0

# If this zone matches the target, skip it. Otherwise, add it to new_zones
execute unless score #current_zone global = #zone_to_remove global run data modify storage zombies:temp new_zones append from storage zombies:temp old_zones[0]

# Remove first element and recurse
data remove storage zombies:temp old_zones[0]
function zombies:build_kit/management/door/remove_zone_recursive
