# ===================================
# CUTSCENES MODULE - TICK
# ===================================
# Purpose: Per-tick cutscene logic
# ===================================

# End game pan (1)
execute if score #global cutscene_active matches 1 run function zbk:map_elements/cutscenes/end_game/camera/tick with storage zbk:cutscene

# Start game pan (2)
execute if score #global cutscene_active matches 2 run function zbk:map_elements/cutscenes/start_game/camera/tick with storage zbk:cutscene

# End game timed (3)
execute if score #global cutscene_active matches 3 run function zbk:map_elements/cutscenes/end_game/camera/tick_timed

# Start game timed (4)
execute if score #global cutscene_active matches 4 run function zbk:map_elements/cutscenes/start_game/camera/tick_timed

function zbk:map_elements/cutscenes/events/cutscene_tick
