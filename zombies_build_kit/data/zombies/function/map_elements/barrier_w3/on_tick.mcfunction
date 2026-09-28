# Finish the breaking pass before attempting repairs on any barrier.
# Player repair cooldown and points are shared across barriers, so these phases cannot be interleaved.

# ===================================
# BARRIER W3 SUBMODULE - TICK
# ===================================
# Runs every game tick for wide barrier system

# ===== SPAWN EGG DETECTION =====
execute if entity @e[type=minecraft:silverfish,name="Barrier Marker (3-Wide)"] run function zombies:map_elements/barrier_w3/spawning/spawn

# ===== ZOMBIE BREAKING LOGIC =====
execute as @e[type=marker,tag=barrier_w3] at @s run function zombies:map_elements/barrier_w3/zombie/tick

# ===== PLAYER REPAIR DETECTION =====
execute as @e[type=marker,tag=barrier_w3,scores={bw3_state=1..}] at @s run function zombies:map_elements/barrier_w3/player/detect_repair

# ===== UPDATE REPAIR TEXT VISIBILITY =====
execute as @e[type=marker,tag=barrier_w3] at @s run function zombies:map_elements/barrier_w3/management/update_repair_text
