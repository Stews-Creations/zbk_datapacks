# === OPEN LINKED DOORS RECURSIVE ===
# Pops first linked door ID from array and opens it, then recurses.

# Check if there are more doors to open
execute unless data storage zombies:temp linked_doors_to_open[0] run return 0

# Read the next linked door ID
execute store result score #cd_linked_id global run data get storage zombies:temp linked_doors_to_open[0]
data remove storage zombies:temp linked_doors_to_open[0]

# Find an unpurchased sign with matching link ID and open it
# (skip if already purchased - prevents infinite loops from bidirectional links)
execute as @e[type=marker,tag=custom_door_sign,tag=!purchased] if score @s custom_door_id = #cd_linked_id global run function zombies:map_elements/custom_door/buy/open

# Recurse for remaining linked doors
function zombies:map_elements/custom_door/buy/open_linked_recursive
