# Clean up dropped items after empty template placement
# This runs 1 second after empty templates are placed

# Kill any dropped items (item frames or paintings that popped off from empty template)
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:item_frame"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:glow_item_frame"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:filled_map"}},distance=..5]
execute as @e[type=marker,tag=wolf_spawn_location] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:painting"}},distance=..5]
