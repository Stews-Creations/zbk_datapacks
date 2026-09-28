# === ASSIGN SEQUENTIAL ID TO MARKER ===
# Called for each marker during reset_ids
# Increments counter and assigns it to this marker

# Increment the counter
scoreboard players add #next_id mystery_box_location_id 1

# Assign the current counter value to this marker
scoreboard players operation @s mystery_box_location_id = #next_id mystery_box_location_id
