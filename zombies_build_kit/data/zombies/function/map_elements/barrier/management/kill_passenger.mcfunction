# ===================================
# BARRIER MANAGEMENT - KILL PASSENGER
# ===================================
# Purpose: Hide one passenger by making it invisible (scale to 0)
#
# Context: Executed as barrier marker, positioned at boards_spawn location
# ===================================

# Hide one passenger by setting its scale to 0 (makes it invisible but maintains parent-child relationship)
# Tag it as "hidden" so we don't hide it again - do both operations in one command to ensure same entity
execute as @e[type=item_display,tag=barrier_passenger,tag=!barrier_hidden,distance=..2,limit=1,sort=nearest] run function zombies:map_elements/barrier/management/hide_board
