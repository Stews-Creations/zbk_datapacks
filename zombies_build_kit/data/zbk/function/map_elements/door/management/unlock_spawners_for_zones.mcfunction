# === UNLOCK SPAWNERS FOR DOOR ZONES ===
# Called when a door is purchased
# Unlocks all spawners that match any of the door's zones

# Copy door's zones to temp storage for processing
data modify storage zbk:temp unlock_zones set from entity @s data.zones

# Process each zone recursively
function zbk:map_elements/door/management/unlock_spawners_recursive
