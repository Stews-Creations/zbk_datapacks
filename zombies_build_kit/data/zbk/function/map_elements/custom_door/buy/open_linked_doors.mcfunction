# === OPEN LINKED DOORS ===
# Called after a door opens. Reads linked_doors array and opens each one.
# Runs as the sign marker that was just purchased.

# Check if linked_doors array exists and has entries
execute unless data entity @s data.linked_doors run return 0
execute unless data entity @s data.linked_doors[0] run return 0

# Copy linked_doors to temp storage for recursive processing
data modify storage zbk:temp linked_doors_to_open set from entity @s data.linked_doors

# Process each linked door
function zbk:map_elements/custom_door/buy/open_linked_recursive
