# ===================================
# FIRE FLOOR SUBMODULE - TICK
# ===================================
# Purpose: Spawn fire particles at all fire floor markers
# Only spawns particles when toggle is ON (1)
#
# Dependencies: fire_floor/on_load.mcfunction
# ===================================

# Only spawn particles if toggle is ON
execute if score #fire_floor fire_floor_toggle matches 1 run function zbk:map_elements/fire_floor/effects/spawn_particles
