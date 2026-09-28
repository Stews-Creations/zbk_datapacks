# Context: one barrier marker at its position.
# Detect attackers before advancing this barrier timer, retaining same-tick break behavior.

function zombies:map_elements/barrier/zombie/detect_nearby
execute if score @s barrier_break_timer matches 1.. if score @s barrier_state matches ..5 run function zombies:map_elements/barrier/zombie/break_barrier_timer
