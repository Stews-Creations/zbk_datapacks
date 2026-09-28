# === REMOVE LINKED DOOR FROM SINGLE SIGN ===
# Runs as each sign marker. Uses #ld_to_remove from global.

# Copy linked_doors to temp storage and prepare new array
data modify storage zbk:temp old_linked_doors set from entity @s data.linked_doors
data modify storage zbk:temp new_linked_doors set value []

# Filter out the target door ID
function zbk:build_kit/management/custom_door_sign/linked_door/recursive

# Set the filtered array back
data modify entity @s data.linked_doors set from storage zbk:temp new_linked_doors
