# Finish the breaking pass before attempting repairs on any barrier.
# Player repair cooldown and points are shared across barriers, so these phases cannot be interleaved.

# ===================================
# BARRIER SUBMODULE - TICK
# ===================================
# Runs every game tick for barrier system

# ===== SPAWN EGG DETECTION =====
# Detect and process placement of barrier spawn egg entities (silverfish marker)
execute if entity @e[type=minecraft:silverfish,name="Barrier Marker"] run function zbk:map_elements/barrier/spawning/spawn

# ===== ZOMBIE BREAKING LOGIC =====
# Check for zombies and progress each attacked barrier's break timer
execute as @e[type=marker,tag=barrier] at @s run function zbk:map_elements/barrier/zombie/tick

# ===== PLAYER REPAIR DETECTION =====
# Check for sneaking players near damaged barriers
execute as @e[type=marker,tag=barrier,scores={barrier_state=1..}] at @s run function zbk:map_elements/barrier/player/detect_repair

# Repair-text visibility updates on damage, full repair, and display reconstruction.
