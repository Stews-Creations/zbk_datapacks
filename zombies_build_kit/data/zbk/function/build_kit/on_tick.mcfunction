# Authoring remains available outside an active game; gameplay gates belong to the owning runtime command.

# ===================================
# BUILD KIT MODULE - TICK
# ===================================
# Runs every game tick for build kit trigger processing

# Process build kit trigger commands (admin tools, spawn eggs, etc.)
function zbk:build_kit/triggers/dispatch

# Display zone particles if highlight is active
execute if score #highlight_zone global matches 0.. run function zbk:build_kit/zones/display_zone_particles
