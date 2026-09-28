# ===================================
# POWER SUBMODULE - LOAD
# ===================================
# Purpose: Initialize power system scoreboards and triggers
#
# Dependencies: None
#
# Scoreboards Created:
# - power
#
# Triggers Created:
# - turn_power_on, turn_power_off, give_power_egg
# ===================================

# ===== POWER SYSTEM SCOREBOARDS =====
scoreboard objectives add power dummy

# Initialize default values
execute unless score #power_required power matches 0..1 run scoreboard players set #power_required power 1
function zombies:map_elements/power/initialize

# Power triggers
# (enables are done per-player in map_elements/power/initialize)
scoreboard objectives add toggle_power_required trigger
scoreboard objectives add turn_power_on trigger
scoreboard objectives add turn_power_off trigger
scoreboard objectives add give_power_egg trigger
