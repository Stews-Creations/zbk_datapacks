# === DETECT AND PLACE PLAYER BLOCK MARKER ===
# Detects when a player block marker egg is placed and converts it to a marker

# Detect cat with name "Player Block Marker" and convert to marker
execute if entity @e[type=minecraft:cat,name="Player Block Marker"] run function zombies:behavior/areas/player_block/convert_player_block_to_marker
