# === GET NTH SPAWN LOCATION ID ===
# Runs as each spawn location marker
# Increments counter and stores ID when counter matches random selection

# Increment the spawn index
scoreboard players add #spawn_index mystery_box_location_id 1

# If this is the selected index, store the location ID
execute if score #spawn_index mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players operation #selected_location_id mystery_box_location_id = @s mystery_box_location_id
