# === REMOVE LINKED DOOR RECURSIVE ===
# Recursively removes all instances of #ld_to_remove from the linked_doors array

# Try to read position 0
execute store result score #current_ld global run data get storage zbk:temp old_linked_doors[0]
execute unless data storage zbk:temp old_linked_doors[0] run return 0

# If this ID matches the target, skip it. Otherwise, keep it.
execute unless score #current_ld global = #ld_to_remove global run data modify storage zbk:temp new_linked_doors append from storage zbk:temp old_linked_doors[0]

# Remove first element and recurse
data remove storage zbk:temp old_linked_doors[0]
function zbk:map_elements/custom_door/build_kit/sign/linked_door/recursive
