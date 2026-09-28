# ===================================
# JUMP PAD - UNLIGHT LAMPS
# ===================================
# Purpose: Turn off the 8 outer ring redstone lamps
# Called on reset/initialize
# ===================================

# 8 outer ring positions at floor level (Y-1 from marker)
setblock ~-1 ~-1 ~-1 redstone_lamp[lit=false] replace
setblock ~0 ~-1 ~-1 redstone_lamp[lit=false] replace
setblock ~1 ~-1 ~-1 redstone_lamp[lit=false] replace
setblock ~-1 ~-1 ~0 redstone_lamp[lit=false] replace
setblock ~1 ~-1 ~0 redstone_lamp[lit=false] replace
setblock ~-1 ~-1 ~1 redstone_lamp[lit=false] replace
setblock ~0 ~-1 ~1 redstone_lamp[lit=false] replace
setblock ~1 ~-1 ~1 redstone_lamp[lit=false] replace
