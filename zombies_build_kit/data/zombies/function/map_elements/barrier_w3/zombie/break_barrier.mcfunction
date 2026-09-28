# ===== INCREMENT BARRIER STATE =====
scoreboard players add @s bw3_state 1

# ===== BREAK PASSENGER/PARENT =====
function zombies:map_elements/barrier_w3/zombie/break_passenger

# ===== RESET BREAK TIMER =====
scoreboard players set @s bw3_break_timer 0
