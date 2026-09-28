# ===================================
# BLOCKS SUBMODULE - LOAD
# ===================================
# Purpose: Initialize block utility marker systems.

# Trigger used by blocks dialog
scoreboard objectives add give_power_lamp_marker trigger

# Apply reload state to all existing markers
function zbk:map_elements/blocks/management/reload
