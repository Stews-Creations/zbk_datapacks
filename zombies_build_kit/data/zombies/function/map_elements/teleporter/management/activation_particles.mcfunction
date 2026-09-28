# Snapshot the start marker link ID before switching executor to linked ends.
# Each matching end receives the complete particle group, including duplicate configured endpoints.

# ===================================
# TELEPORTER - ACTIVATION PARTICLES
# ===================================
# Purpose: Spawn particles at both start and end pads during activation
# Executed as the active start marker, at the start marker
# ===================================

# Particles at start pad
particle minecraft:electric_spark ~ ~1.5 ~ 0.5 0.8 0.5 0.02 1 force
particle minecraft:reverse_portal ~ ~0.5 ~ 0.4 0.3 0.4 0.05 4 force
particle minecraft:end_rod ~ ~1 ~ 0.3 0.5 0.3 0.01 1 force

# Find linked end marker and spawn particles there too
execute store result score #active_tp_id teleporter_id run scoreboard players get @s teleporter_id
execute as @e[type=marker,tag=teleporter,tag=tp_end] if score @s teleporter_id = #active_tp_id teleporter_id at @s run function zombies:map_elements/teleporter/management/end_particles
