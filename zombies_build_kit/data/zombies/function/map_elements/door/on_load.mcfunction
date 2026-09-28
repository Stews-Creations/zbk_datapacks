# ===================================
# DOORS SUBMODULE - LOAD
# ===================================
# Purpose: Initialize door system scoreboards and triggers
#
# Dependencies: None
#
# Scoreboards Created:
# - door_price
#
# Triggers Created:
# - give_door_egg, give_gate_door_egg, give_powered_door_egg
# - give_powered_stairs_door_egg, give_powered_power_room_door_egg
# - give_powered_church_door_egg
# - reset_doors, set_door_price, prompt_door_price
# ===================================

# ===== DOOR SYSTEM SCOREBOARDS =====
scoreboard objectives add door_price dummy "Door Price"
scoreboard objectives add door_anim_timer dummy "Door Animation Timer"

# Initialize default values
function zombies:map_elements/door/initialize

# Door triggers
# (enables are done per-player in map_elements/door/initialize)
scoreboard objectives add give_door_egg trigger
scoreboard objectives add give_gate_door_egg trigger
scoreboard objectives add give_jump_spot_egg trigger
scoreboard objectives add give_powered_door_egg trigger
scoreboard objectives add give_powered_stairs_door_egg trigger
scoreboard objectives add give_powered_power_room_door_egg trigger
scoreboard objectives add give_powered_church_door_egg trigger
scoreboard objectives add reset_doors trigger
scoreboard objectives add set_door_price trigger
scoreboard objectives add prompt_door_price trigger
