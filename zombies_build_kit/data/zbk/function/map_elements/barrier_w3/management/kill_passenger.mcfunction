# ===================================
# BARRIER W3 MANAGEMENT - KILL PASSENGER
# ===================================
# Context: Executed as barrier_w3 marker, positioned at boards_spawn_w3 location

execute as @e[type=item_display,tag=barrier_w3_passenger,tag=!barrier_w3_hidden,distance=..2,limit=1,sort=nearest] run function zbk:map_elements/barrier_w3/management/hide_board
