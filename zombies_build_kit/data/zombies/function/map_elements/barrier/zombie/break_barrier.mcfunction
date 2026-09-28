# The first broken board exposes the repair prompt in the same tick as the state change.
# Later damage stages reuse that visibility until full repair or reconstruction.

# ===== INCREMENT BARRIER STATE =====
scoreboard players add @s barrier_state 1
execute if score @s barrier_state matches 1 run function zombies:map_elements/barrier/management/update_repair_text

# ===== BREAK PASSENGER/PARENT =====
# Call the passenger breaking function to handle entity removal and sounds
function zombies:map_elements/barrier/zombie/break_passenger

# ===== RESET BREAK TIMER =====
scoreboard players set @s barrier_break_timer 0
