# === DETECT AND PLACE ZOMBIE BLOCK MARKER ===
# Detects when a zombie block marker egg is placed and converts it to a marker

# Detect creeper with name "Zombie Block Marker" and convert to marker
execute if entity @e[type=minecraft:creeper,name="Zombie Block Marker"] run function zombies:behavior/areas/zombie_barrier_block/convert_zombie_block_to_marker
