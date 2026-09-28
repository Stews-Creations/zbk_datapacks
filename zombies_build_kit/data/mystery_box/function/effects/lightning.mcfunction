# ===================================
# LIGHTNING EFFECT
# ===================================
# Spawns a single lightning flash
# Called positioned 2 blocks above entity
# $direction: north, east, south, or west (not used, kept for compatibility)
# ===================================

# Just spawn one flash particle
particle minecraft:flash{color:[1.0,1.0,0.8,1.0]} ~ ~ ~ 0 0 0 0 1 force
