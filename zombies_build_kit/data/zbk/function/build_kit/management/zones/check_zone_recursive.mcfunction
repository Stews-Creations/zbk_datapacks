# === CHECK ZONE RECURSIVE ===
# Recursively checks if zones array contains the target zone
# If match found, shows particle and returns

# Check if array is empty
execute unless data storage zbk:temp check_zones[0] run return 0

# Get current zone from first element
execute store result score #current_zone global run data get storage zbk:temp check_zones[0]

# If this zone matches the target, show particle and return
execute if score #current_zone global = #highlight_zone global at @s run particle minecraft:dust{color:[0.0,0.5,1.0],scale:1.0} ~ ~1 ~ 0.2 0.5 0.2 0 10 force
execute if score #current_zone global = #highlight_zone global run return 1

# Remove first element and recurse
data remove storage zbk:temp check_zones[0]
function zbk:build_kit/management/zones/check_zone_recursive
