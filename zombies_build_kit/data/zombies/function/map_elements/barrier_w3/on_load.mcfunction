# ===================================
# BARRIER W3 SUBMODULE - LOAD
# ===================================
# Purpose: Initialize wide barrier system scoreboards
# ===================================

# ===== BARRIER STATE SCOREBOARDS =====
scoreboard objectives add bw3_state dummy
scoreboard objectives add bw3_break_timer dummy

# ===== BUILD KIT TRIGGERS =====
scoreboard objectives add give_barrier_w3 trigger

# ===== INITIALIZE SYSTEM =====
function zombies:map_elements/barrier_w3/initialize
