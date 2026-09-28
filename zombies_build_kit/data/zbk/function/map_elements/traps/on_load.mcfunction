# ===================================
# TRAPS SUBMODULE - LOAD
# ===================================
# Purpose: Initialize trap system scoreboards and triggers
#
# Dependencies: None
#
# Scoreboards Created:
# - trap_timer, trap_id, trap_cost, trap_duration, trap_cooldown
#
# Triggers Created:
# - give_electric_trap_egg, reset_traps, link_traps
# - set_trap_price, prompt_trap_price, delete_trap
# ===================================

# ===== TRAP SYSTEM SCOREBOARDS =====
# Electric trap scoreboards
scoreboard objectives add trap_timer dummy "Trap Timer"
scoreboard objectives add trap_id dummy "Trap ID"
scoreboard objectives add trap_cost dummy "Trap Cost"
scoreboard objectives add trap_duration dummy "Trap Duration"
scoreboard objectives add trap_cooldown dummy "Trap Cooldown"

# Initialize trap constants
scoreboard players set #20 trap_cost 20

# Trap triggers
# (enables are done per-player in map_elements/traps/initialize)
scoreboard objectives add give_electric_trap_egg trigger
scoreboard objectives add reset_traps trigger
scoreboard objectives add link_traps trigger
scoreboard objectives add set_trap_price trigger
scoreboard objectives add prompt_trap_price trigger
scoreboard objectives add delete_trap trigger

# ===== INITIALIZE =====
# Set trap system to default values
function zbk:map_elements/traps/initialize
