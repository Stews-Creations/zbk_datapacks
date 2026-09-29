# === REMOVE ZONE FROM SINGLE SIGN ===
# Runs as each sign marker. Uses #zone_to_remove from global.

# Copy zones to temp storage and prepare new array
data modify storage zbk:temp old_zones set from entity @s data.zones
data modify storage zbk:temp new_zones set value []

# Filter out the target zone
function zbk:map_elements/custom_door/build_kit/sign/zone/recursive

# Set the filtered array back
data modify entity @s data.zones set from storage zbk:temp new_zones
