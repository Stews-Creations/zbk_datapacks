# ===================================
# BLOCKS SUBMODULE - TICK
# ===================================
# Detect placed power lamp frames and convert them to markers.

execute as @e[type=minecraft:glow_item_frame,name="Power Lamp Marker Frame"] at @s run function zbk:map_elements/blocks/spawning/spawn
