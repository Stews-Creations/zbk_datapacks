# Context: one barrier marker at its position.
# Detect attackers before advancing this barrier timer, retaining same-tick break behavior.

function zbk:map_elements/barrier_w3/zombie/detect_nearby
execute if score @s bw3_break_timer matches 1.. if score @s bw3_state matches ..5 run function zbk:map_elements/barrier_w3/zombie/break_barrier_timer
