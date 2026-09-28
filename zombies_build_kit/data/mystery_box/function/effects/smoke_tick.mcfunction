# ===================================
# SMOKE TICK LOOP
# ===================================
# Runs every tick for 2 seconds (40 ticks total)
# Executed as the marker entity from main tick function
# ===================================

# Spawn particles at this position
function mystery_box:effects/smoke_tick_effects

# Increment timer
scoreboard players add @s mystery_box 1

# Kill self after 60 ticks (3 seconds)
execute if score @s mystery_box matches 60.. run kill @s
