# === INDEX SPAWN POINT MARKERS ===
# Assigns sequential IDs (1, 2, 3...) to all spawn point markers
# Called after placing or deleting spawn point markers

# Reset all existing IDs
scoreboard players set @e[type=marker,tag=spawn_point_marker] spawn_point_id 0

# Reset counter
scoreboard players set #next_id spawn_point_id 0

# Assign sequential IDs to each marker
execute as @e[type=marker,tag=spawn_point_marker] run function zbk:game/spawn_points/markers/assign_id

# Store total count
scoreboard players operation #spawn_point_total spawn_point_id = #next_id spawn_point_id
