# Game-state transitions belong here after the other module-wide phases; reset work delegates to owners.

# ===================================
# GAME MODULE - TICK
# ===================================
# Runs every game tick for game state management

# Detect spawn point marker placement
function zombies:game/management/spawn_point/place_marker

# Detect worldspawn marker placement
function zombies:game/management/worldspawn/place_marker

# Detect spawn menu marker placement
function zombies:game/management/spawn_menu/place_marker
