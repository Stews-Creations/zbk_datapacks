# ===================================
# BARRIER SUBMODULE - LOAD
# ===================================
# Purpose: Initialize barrier system scoreboards
#
# Dependencies: None
#
# Scoreboards Created:
# - barrier_state: Current damage state of barrier (0=intact, 4=fully broken)
# - barrier_break_timer: Timer for zombie breaking progress
# - barrier_point_repairs: Per-player count of point-earning repairs this round
# ===================================

# ===== BARRIER STATE SCOREBOARDS =====
# Track damage state for each barrier marker (0-4)
scoreboard objectives add barrier_state dummy

# Timer for zombie breaking animation/progression
scoreboard objectives add barrier_break_timer dummy

# ===== PLAYER REPAIR TRACKING =====
# Track how many point-earning repairs each player has done this round
scoreboard objectives add barrier_point_repairs dummy

# Cooldown timer for repair actions (20 ticks = 1 second)
scoreboard objectives add barrier_repair_cooldown dummy

# ===== BUILD KIT TRIGGERS =====
# Trigger for giving barrier spawn marker
scoreboard objectives add give_barrier_marker trigger

# ===== INITIALIZE SYSTEM =====
# Set barrier system to default values
function zombies:map_elements/barrier/initialize
