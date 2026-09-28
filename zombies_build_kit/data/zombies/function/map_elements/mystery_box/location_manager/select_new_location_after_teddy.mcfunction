# === SELECT NEW LOCATION AFTER TEDDY BEAR ===
# Called from teddy_bear_complete_at_location
# @s = mystery_box_location marker (the OLD location)
# Only handles selecting and spawning at NEW location
# Old location cleanup is already done by teddy_bear_complete_at_location

# If no locations exist or only 1 location, cannot move
execute unless score #total_locations mystery_box_location_id matches 2.. run return 0

# Store current location as previous (for finding a different location)
scoreboard players operation #previous_location mystery_box_location_id = #current_location mystery_box_location_id

# Deactivate current location
scoreboard players set @s mystery_box_active 0
scoreboard players set @s mystery_box_ready 0

# Generate new random location (try up to 10 times to avoid previous)
scoreboard players set #attempts mystery_box_location_id 0
function zombies:map_elements/mystery_box/location_manager/find_new_location_loop
