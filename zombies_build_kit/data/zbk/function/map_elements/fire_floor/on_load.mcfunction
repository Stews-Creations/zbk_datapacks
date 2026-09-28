# ===================================
# FIRE FLOOR SUBMODULE - LOAD
# ===================================
# Purpose: Initialize fire floor particle effect system
#
# Dependencies: None
#
# Scoreboards Created:
# - fire_floor_toggle (global toggle for all fire effects)
#
# Triggers Created:
# - toggle_fire_floor, give_fire_floor_egg
# ===================================

# ===== FIRE FLOOR SYSTEM SCOREBOARDS =====
scoreboard objectives add fire_floor_toggle dummy "Fire Floor Toggle"

# Fire floor triggers
# (enables are done per-player in map_elements/fire_floor/initialize)
scoreboard objectives add toggle_fire_floor trigger
scoreboard objectives add give_fire_floor_egg trigger

# ===== INITIALIZE =====
# Set fire floor system to default values
function zbk:map_elements/fire_floor/initialize
