# Keep placement on the tick path; the shared maintenance hook handles saved-marker reconciliation.

# ===================================
# WALL GUN SUBMODULE - TICK
# ===================================
# Runs every game tick for wall gun system

# ===== SPAWN EGG DETECTION =====
# Detect and process placement of wall gun marker bats
execute if entity @e[type=minecraft:bat,name="Wall Gun Marker"] run function zbk:map_elements/wall_gun/spawning/spawn
# Saved-marker maintenance runs through global/tick_1s; purchases still validate immediately.
