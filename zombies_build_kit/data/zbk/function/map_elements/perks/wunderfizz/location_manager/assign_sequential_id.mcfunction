# Assign sequential ID to this wunderfizz location marker
# Increments global counter and assigns to this marker

# Increment the counter
scoreboard players add #wunderfizz_id_counter wunderfizz_id 1

# Assign the current counter value to this marker
scoreboard players operation @s wunderfizz_id = #wunderfizz_id_counter wunderfizz_id

# Store total count in global variable
scoreboard players operation #wunderfizz_total_locations wunderfizz_id = #wunderfizz_id_counter wunderfizz_id
