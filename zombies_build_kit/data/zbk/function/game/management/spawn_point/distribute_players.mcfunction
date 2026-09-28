# === DISTRIBUTE PLAYERS ACROSS SPAWN POINTS (ROUND-ROBIN) ===
# Iterates through players with tag=spawn_pending, assigns each to the next
# spawn point marker in sequence, looping back to 1 when exceeding total
# Context: Called by tp_all_players and respawn_dead_players

# Index all spawn point markers (assigns sequential IDs)
function zbk:game/management/spawn_point/index_markers

# Initialize round-robin counter
scoreboard players set #spawn_point_idx spawn_point_idx 0

# Loop through each player that needs spawning
execute as @a[tag=spawn_pending] run function zbk:game/management/spawn_point/assign_player_spawn
