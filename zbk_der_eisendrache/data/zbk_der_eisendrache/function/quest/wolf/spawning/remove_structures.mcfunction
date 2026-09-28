# Remove old wolf painting structures by killing item frames at all spawn locations
# This removes old paintings before new structures are placed

# Kill item frames at all spawn locations
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item_frame,distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=glow_item_frame,distance=..5]

# Kill any dropped items
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:item_frame"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:glow_item_frame"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:filled_map"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:painting"}},distance=..5]
