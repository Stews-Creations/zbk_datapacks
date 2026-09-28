# Loop to find a new location different from previous
# Generates random location and checks if different

# Increment attempt counter
scoreboard players add #wunderfizz_attempts wunderfizz_id 1

# Generate new random location
execute store result score #wunderfizz_current_location wunderfizz_id run random value 1..2147483647
scoreboard players operation #wunderfizz_current_location wunderfizz_id %= #wunderfizz_total_locations wunderfizz_id
scoreboard players add #wunderfizz_current_location wunderfizz_id 1

# If same as previous and haven't exceeded attempts, try again
execute if score #wunderfizz_current_location wunderfizz_id = #wunderfizz_previous_location wunderfizz_id if score #wunderfizz_attempts wunderfizz_id matches ..10 run function zbk:map_elements/perks/wunderfizz/location_manager/find_new_location_loop
