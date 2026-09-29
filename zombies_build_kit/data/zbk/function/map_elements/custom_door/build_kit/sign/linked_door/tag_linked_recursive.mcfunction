# === TAG LINKED DOORS RECURSIVE ===
# Reads IDs from storage zbk:temp ld_to_tag array and tags matching signs with cd_in_group

execute unless data storage zbk:temp ld_to_tag[0] run return 0

# Read the next door ID
execute store result score #ld_tag_id global run data get storage zbk:temp ld_to_tag[0]
data remove storage zbk:temp ld_to_tag[0]

# Tag all signs with this door ID
execute as @e[type=marker,tag=custom_door_sign] if score @s custom_door_id = #ld_tag_id global run tag @s add cd_in_group

# Recurse
function zbk:map_elements/custom_door/build_kit/sign/linked_door/tag_linked_recursive
