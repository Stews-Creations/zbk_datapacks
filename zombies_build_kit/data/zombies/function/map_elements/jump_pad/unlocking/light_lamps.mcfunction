# ===================================
# JUMP PAD - LIGHT LAMPS
# ===================================
# Purpose: Light the 8 outer ring redstone lamps at floor level
# Layout: 3x3 grid, lamps on edges, solid block center
# Executed at: marker position (lamps are Y-1 from marker)
# ===================================

# Fill all lamps in 3x3 area at Y-1 to lit state
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 redstone_lamp[lit=true] replace redstone_lamp strict
