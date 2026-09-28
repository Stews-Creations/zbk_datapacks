# ===================================
# BARRIER MANAGEMENT - RESET REPAIR LIMITS
# ===================================
# Purpose: Reset per-player repair counters at the start of each round
#
# Called from: waves system when new round starts
# ===================================

# ===== RESET ALL PLAYER COUNTERS =====
# Reset barrier repair point counters for all players
scoreboard players set @a barrier_point_repairs 0
