# Placement runs even when no active trap exists; the runtime helper owns its own absence gate.

# ===================================
# TRAPS SUBMODULE - TICK
# ===================================
# Runs every game tick for trap system

# ===== NAMED FRAME DETECTION =====
execute as @e[type=minecraft:glow_item_frame,name="Trap Bottom Left Frame"] at @s run function zbk:map_elements/traps/electric/spawning/spawn_corner1
execute as @e[type=minecraft:glow_item_frame,name="Trap Top Right Frame"] at @s run function zbk:map_elements/traps/electric/spawning/spawn_corner2
execute as @e[type=minecraft:glow_item_frame,name="Trap Sign Frame"] at @s run function zbk:map_elements/traps/electric/spawning/spawn_sign_marker

# ===== TRAP SYSTEMS =====
function zbk:map_elements/traps/electric/core/tick_all
