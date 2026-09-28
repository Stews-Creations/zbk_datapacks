# ===================================
# JUMP PAD MODULE - LOAD
# ===================================
# Purpose: Initialize jump pad system scoreboards
#
# Dependencies: None
# ===================================

# ===== SCOREBOARD OBJECTIVES =====
# Arc animation scoreboards
scoreboard objectives add arc_t dummy
scoreboard objectives add arc_start_x dummy
scoreboard objectives add arc_start_y dummy
scoreboard objectives add arc_start_z dummy
scoreboard objectives add arc_peak_x dummy
scoreboard objectives add arc_peak_y dummy
scoreboard objectives add arc_peak_z dummy
scoreboard objectives add arc_end_x dummy
scoreboard objectives add arc_end_y dummy
scoreboard objectives add arc_end_z dummy
scoreboard objectives add arc_calc dummy
scoreboard objectives add arc_pos_x dummy
scoreboard objectives add arc_pos_y dummy
scoreboard objectives add arc_pos_z dummy

# Purchase system scoreboards
scoreboard objectives add jump_pad_price dummy
scoreboard objectives add jump_pad_cooldown dummy
scoreboard objectives add jump_pad_launch_timer dummy

# ID system for linking multiple jump pads
scoreboard objectives add jump_pad_id dummy

# Initialize jump pad system
function zbk:map_elements/jump_pad/initialize
