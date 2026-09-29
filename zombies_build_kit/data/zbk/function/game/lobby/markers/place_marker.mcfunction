# === DETECT AND PLACE WORLDSPAWN MARKER ===
# Detects when a worldspawn egg is placed and converts it to a marker

# Detect salmon with name "Worldspawn Marker" and convert to marker
execute if entity @e[type=minecraft:salmon,name="Worldspawn Marker"] run function zbk:game/lobby/markers/convert_to_marker
