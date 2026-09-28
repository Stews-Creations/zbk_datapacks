# ===================================
# WALL GUN MODULE - LOAD
# ===================================
# Purpose: Initialize wall gun system scoreboards
#
# Dependencies: None
# ===================================

# ===== SCOREBOARD OBJECTIVES =====
# Wall gun price tracking (temp objectives)
scoreboard objectives add wall_gun_price dummy
scoreboard objectives add wall_gun_ammo_price dummy

# Trigger for spawn egg
# (enable is done per-player in map_elements/wall_gun/initialize)
scoreboard objectives add give_wall_gun_egg trigger

# Initialize wall gun system
function zombies:map_elements/wall_gun/initialize
