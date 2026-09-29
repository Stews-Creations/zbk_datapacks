# === REBUILD LINKED DOORS ===
# Runs as each sign in the group. Rebuilds its linked_doors array
# from all group representatives except itself (unique IDs, no self).

data modify storage zbk:temp ld_new_list set value []
execute store result score #ld_own_id global run scoreboard players get @s custom_door_id

# Add each representative's ID (except own door ID) to the new list
execute as @e[type=marker,tag=cd_group_rep] unless score @s custom_door_id = #ld_own_id global run function zbk:map_elements/custom_door/build_kit/sign/linked_door/append_rep_id

# Set the rebuilt list
data modify entity @s data.linked_doors set from storage zbk:temp ld_new_list
