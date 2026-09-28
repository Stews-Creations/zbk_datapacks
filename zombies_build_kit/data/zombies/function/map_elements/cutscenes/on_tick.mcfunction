# ===================================
# CUTSCENES MODULE - TICK
# ===================================
# Purpose: Per-tick cutscene logic
# ===================================

# End game pan (1)
execute if score #global cutscene_active matches 1 run function zombies:map_elements/cutscenes/end_game/tick with storage zombies:cutscene

# Start game pan (2)
execute if score #global cutscene_active matches 2 run function zombies:map_elements/cutscenes/start_game/tick with storage zombies:cutscene

# End game timed (3)
execute if score #global cutscene_active matches 3 run function zombies:map_elements/cutscenes/end_game/tick_timed

# Start game timed (4)
execute if score #global cutscene_active matches 4 run function zombies:map_elements/cutscenes/start_game/tick_timed

function zbk:dispatch/cutscene_tick
