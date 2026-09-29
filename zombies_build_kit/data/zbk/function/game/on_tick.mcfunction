# Game-state transitions belong here after the other module-wide phases; reset work delegates to owners.

# ===================================
# GAME MODULE - TICK
# ===================================
# Runs every game tick for game state management

# Detect spawn point marker placement
function zbk:game/spawn_points/markers/place_marker

# Detect worldspawn marker placement
function zbk:game/lobby/markers/place_marker
