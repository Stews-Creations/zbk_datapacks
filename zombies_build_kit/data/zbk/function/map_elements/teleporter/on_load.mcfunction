# ===================================
# TELEPORTER MODULE - LOAD
# ===================================
# Purpose: Initialize teleporter system scoreboards
#
# Dependencies: None
# ===================================

# ===== SCOREBOARD OBJECTIVES =====
# ID system for linking start/end markers
scoreboard objectives add teleporter_id dummy

# Purchase/state management
scoreboard objectives add teleporter_price dummy
scoreboard objectives add teleporter_cooldown dummy
scoreboard objectives add teleporter_duration dummy
scoreboard objectives add teleporter_recharge_delay dummy
scoreboard objectives add teleporter_auto_return dummy
scoreboard objectives add teleporter_return_id dummy

# Trigger objectives for spawn eggs
scoreboard objectives add give_tp_start_egg trigger
scoreboard objectives add give_tp_end_egg trigger
scoreboard objectives add give_tp_auto_return_egg trigger

# Initialize teleporter system
function zbk:map_elements/teleporter/initialize
