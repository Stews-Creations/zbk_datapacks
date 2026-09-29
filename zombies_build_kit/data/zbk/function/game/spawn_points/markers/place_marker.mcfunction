# === DETECT AND PLACE SPAWN POINT MARKER ===
# Detects when a spawn point egg is placed and converts it to a marker

# Detect bat with name "Spawn Point" and convert to marker
execute if entity @e[type=minecraft:bat,name="Spawn Point"] run function zbk:game/spawn_points/markers/convert_to_marker
