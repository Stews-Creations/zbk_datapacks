# === CHECK DOOR ZONE AND SHOW PARTICLE ===
# Runs as each door marker
# Checks if the door's zones array contains the target zone (#highlight_zone global)
# If match found, shows blue particle

# Copy zones to temp storage for iteration
data modify storage zbk:temp check_zones set from entity @s data.zones

# Call recursive check
function zbk:build_kit/management/zones/check_zone_recursive
