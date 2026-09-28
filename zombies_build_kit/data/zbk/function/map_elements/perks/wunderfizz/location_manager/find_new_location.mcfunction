# Find a new random location different from current location
# Used when swapping locations after max uses

# Only proceed if there are multiple locations
execute unless score #wunderfizz_total_locations wunderfizz_id matches 2.. run return 0

# Store previous location
scoreboard players operation #wunderfizz_previous_location wunderfizz_id = #wunderfizz_current_location wunderfizz_id

# Try to find a different location (max 10 attempts)
scoreboard players set #wunderfizz_attempts wunderfizz_id 0

# Loop until we find a different location
function zbk:map_elements/perks/wunderfizz/location_manager/find_new_location_loop
