# Module-wide player state runs before the shared per-player lifecycle; keep global and player-context work distinct.

# ===================================
# PLAYER MODULE - TICK
# ===================================
# Runs every game tick for player management systems

# ===== GLOBAL CLEANUP =====
# Remove all XP orbs
kill @e[type=experience_orb]

# ===== BLOCK AREAS =====
function zbk:behavior/areas/player_block/player_area_block
function zbk:behavior/areas/zombie_barrier_block/zombie_barrier_block
