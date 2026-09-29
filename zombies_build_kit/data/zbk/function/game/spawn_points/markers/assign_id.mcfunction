# === ASSIGN SEQUENTIAL ID TO SPAWN POINT MARKER ===
# Called for each marker during index_markers
# Increments counter and assigns it to this marker

# Increment the counter
scoreboard players add #next_id spawn_point_id 1

# Assign the current counter value to this marker
scoreboard players operation @s spawn_point_id = #next_id spawn_point_id
