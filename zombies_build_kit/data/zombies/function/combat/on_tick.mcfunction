# Preserve weapon and powerup phase order; shared inventory, damage, and drop state can change between calls.

# ===================================
# COMBAT MODULE - TICK
# ===================================
# Purpose: Execute per-tick logic for all combat systems
#
# Dependencies: combat/on_load.mcfunction
# ===================================

# ===== SUBMODULE TICK FUNCTIONS =====
function zombies:combat/weapons/on_tick
function zombies:combat/powerups/on_tick
