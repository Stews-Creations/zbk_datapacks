# ===================================
# BARRIER W3 MANAGEMENT - RESTORE PASSENGER
# ===================================
# Context: Executed at boards_spawn_w3 location

execute as @e[type=item_display,tag=barrier_w3_passenger,tag=barrier_w3_hidden,distance=..2,limit=1,sort=nearest] run function zombies:map_elements/barrier_w3/management/show_board
