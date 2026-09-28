# All activation decisions finish before the per-start countdown helper runs.
# Flight movement remains last so newly created arc markers retain their original first-tick movement.

# ===================================
# 115 LAUNCH PAD - TICK
# ===================================
# Purpose: Detect players, manage countdown, and execute launches
# ===================================

# ===== PROXIMITY DETECTION =====
# Reject idle pads with no nearby player before scanning the route and active flights.
# Keep activation and movement as separate global phases around the local countdown helper.
execute as @e[type=marker,tag=115_launch_start] unless score @s 115_launch_timer matches 1.. at @s if entity @a[distance=..2] unless entity @e[type=marker,tag=115_launch_arc,limit=1] if entity @e[type=marker,tag=115_launch_peak,limit=1] if entity @e[type=marker,tag=115_launch_end,limit=1] run function zbk_der_eisendrache:115_launch/management/activate

# ===== COUNTDOWN MANAGEMENT =====
# Decrement timer
execute as @e[type=marker,tag=115_launch_start,scores={115_launch_timer=0..}] at @s run function zbk_der_eisendrache:115_launch/management/tick_start

# When timer reaches 0, launch all players in range (re-check all 3 markers still exist)

# ===== ARC MOVEMENT =====
# Move all active 115 launch arc tracking markers
execute as @e[type=marker,tag=115_launch_arc] at @s run function zbk_der_eisendrache:115_launch/flight/move
