# === REMOVE LINKED DOOR RECURSIVE ===
# Recursively removes all instances of #ld_to_remove from the linked_doors array

# Try to read position 0
execute store result score #current_ld global run data get storage zombies:temp old_linked_doors[0]
execute unless data storage zombies:temp old_linked_doors[0] run return 0

# If this ID matches the target, skip it. Otherwise, keep it.
execute unless score #current_ld global = #ld_to_remove global run data modify storage zombies:temp new_linked_doors append from storage zombies:temp old_linked_doors[0]

# Remove first element and recurse
data remove storage zombies:temp old_linked_doors[0]
function zombies:build_kit/management/custom_door_sign/linked_door/recursive
