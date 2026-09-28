# ===================================
# 115 LAUNCH PAD - MOVE (TWO-PHASE)
# ===================================
# Purpose: Move player in two phases:
#   Phase 1 (arc_t 0-50): Start -> Peak (straight up)
#   Phase 2 (arc_t 51-100): Peak -> End (forward and down)
# Executed as tracking marker with tag=115_launch_arc
# ===================================

# Increment progress
scoreboard players add @s arc_t 4

# --- PHASE 1: Start -> Peak (arc_t 0 to 50) ---
# Linear interpolation: pos = start + (peak - start) * t / 50
execute if score @s arc_t matches ..50 run function zbk_der_eisendrache:115_launch/flight/calc_phase1

# --- PHASE 2: Peak -> End (arc_t 51 to 100) ---
# Linear interpolation: pos = peak + (end - peak) * (t - 50) / 50
execute if score @s arc_t matches 51..100 run function zbk_der_eisendrache:115_launch/flight/calc_phase2

# Apply position to vehicle
execute if score @s arc_t matches ..100 run function zbk_der_eisendrache:115_launch/flight/apply_position

# Complete when done
execute if score @s arc_t matches 101.. run function zbk_der_eisendrache:115_launch/flight/complete
