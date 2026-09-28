# Place structures after a delay to allow cleanup to complete
# This is called via schedule to prevent "Block-attached entity at invalid position" errors

# Place structures at the painting locations with appropriate rotations
function zbk_der_eisendrache:quest/wolf/spawning/place_structures

# Clean up any dropped items (item frames or paintings that may have popped off during placement)
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:item_frame"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:glow_item_frame"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:filled_map"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:painting"}},distance=..5]

# Remove temporary tags
tag @e[type=marker,tag=wolf_painting] remove wolf_painting_unplaced
tag @e[type=marker,tag=wolf_painting] remove wolf_placed
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_assigned
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_target_1
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_target_2
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_target_3
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_target_4
