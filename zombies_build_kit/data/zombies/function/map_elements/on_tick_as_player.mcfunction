# ===================================
# MAP ELEMENTS MODULE - TICK AS PLAYER
# ===================================
# Runs every game tick for each player (called from execute as @a at @s)

# Fire Floor - Convert spawn eggs to markers
execute as @e[type=blaze,name="Fire Floor Marker"] at @s run function zombies:map_elements/fire_floor/spawning/spawn

# Barrier - Decrement repair cooldowns
function zombies:map_elements/barrier/on_tick_as_player
function zombies:map_elements/barrier_w3/on_tick_as_player
