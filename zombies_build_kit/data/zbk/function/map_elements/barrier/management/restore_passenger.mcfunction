# ===================================
# BARRIER MANAGEMENT - RESTORE PASSENGER
# ===================================
# Purpose: Restore one hidden passenger by making it visible again
#
# Context: Executed at boards_spawn location
# ===================================

# Find one hidden passenger and restore its original scale
# We can't restore the exact original scale, but we can use a default visible scale
execute as @e[type=item_display,tag=barrier_passenger,tag=barrier_hidden,distance=..2,limit=1,sort=nearest] run function zbk:map_elements/barrier/management/show_board
