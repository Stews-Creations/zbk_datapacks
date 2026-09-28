# ===================================
# BUILD KIT - PLACEMENT CLEANUP
# ===================================
# Runs as a glow_item_frame at placement position.
# Consumes the placed frame and its dropped frame item.

kill @s
kill @e[type=item,distance=..1.5,nbt={Item:{id:"minecraft:glow_item_frame"}}]
