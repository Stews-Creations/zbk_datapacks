# === REMOVE ZONE FROM SINGLE SIGN ===
# Runs as each sign marker. Uses #zone_to_remove from global.

# Copy zones to temp storage and prepare new array
data modify storage zombies:temp old_zones set from entity @s data.zones
data modify storage zombies:temp new_zones set value []

# Filter out the target zone
function zombies:build_kit/management/custom_door_sign/zone/recursive

# Set the filtered array back
data modify entity @s data.zones set from storage zombies:temp new_zones
