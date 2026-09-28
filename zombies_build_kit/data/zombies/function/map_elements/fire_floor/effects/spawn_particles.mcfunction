# One marker selection supplies the origin for all local effects; damage remains in its owning phase.

# ===================================
# FIRE FLOOR - SPAWN PARTICLES
# ===================================
# Purpose: Spawn fire and smoke particles at each fire floor marker
# Called every tick when fire floor toggle is ON

# Emit flame and smoke at each floor; the helper retains the burst cadence.
execute at @e[type=marker,tag=fire_floor_marker] run function zombies:map_elements/fire_floor/effects/at_marker
