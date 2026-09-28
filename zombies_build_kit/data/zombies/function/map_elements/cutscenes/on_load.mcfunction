# ===================================
# CUTSCENES MODULE - LOAD
# ===================================
# Purpose: Initialize cutscene system scoreboards
#
# Dependencies: None
# ===================================

# Cutscene state tracking (0=off, 1=end pan, 2=start pan, 3=end timed, 4=start timed)
scoreboard objectives add cutscene_active dummy
scoreboard objectives add cutscene_timer dummy
scoreboard objectives add cutscene_const dummy
scoreboard objectives add zbk_video dummy
