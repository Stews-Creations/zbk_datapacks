# ===================================
# JUMP PAD - MOVE ARC ANIMATION
# ===================================
# Purpose: Execute quadratic Bezier curve movement for jump pad arc
#
# Formula: P(t) = (1-t)² * P0 + 2(1-t)t * P1 + t² * P2
# Where P0 = start, P1 = peak (calculated midpoint with peak height), P2 = end
# t goes from 0 to 100 (using integers for scoreboard math)
#
# Dependencies:
# - Requires @s to be marker entity with tag=jump_arc
# - Requires arc position scoreboards initialized in start.mcfunction
# ===================================

# Increment progress at constant speed (slower = smaller jumps = stay mounted)
scoreboard players add @s arc_t 2

# Calculate Bezier curve position
execute if score @s arc_t matches ..100 run function zombies:map_elements/jump_pad/management/calculate_position

# Apply the calculated position
execute if score @s arc_t matches ..100 run function zombies:map_elements/jump_pad/management/apply_position

# Check for completion (after applying position at t=100)
execute if score @s arc_t matches 101.. run function zombies:map_elements/jump_pad/management/complete_arc
