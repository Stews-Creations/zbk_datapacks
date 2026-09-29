# === INITIALIZE MYSTERY BOX LOCATION SYSTEM (SPAWN ONLY) ===
# Picks a random location marker from spawn-tagged locations only
# Called when mystery_box_unlocked = 0 and spawn locations exist

# Clear previous/current location
scoreboard players set #previous_location mystery_box_location_id 0
scoreboard players set #current_location mystery_box_location_id 0

# Count spawn locations
function zbk:map_elements/mystery_box/locations/index/count_spawn_locations

# If no spawn locations exist, fallback to all locations
execute unless score #total_spawn_locations mystery_box_location_id matches 1.. run return run function zbk:map_elements/mystery_box/locations/lifecycle/init_system_unrestricted

# Generate random location ID (1 to total spawn locations)
execute store result score #random_location mystery_box_location_id run random value 1..2147483647
scoreboard players operation #random_location mystery_box_location_id %= #total_spawn_locations mystery_box_location_id
scoreboard players add #random_location mystery_box_location_id 1

# Assign sequential IDs to spawn locations and select the Nth one
scoreboard players set #spawn_index mystery_box_location_id 0
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_spawn_location=1}] run function zbk:map_elements/mystery_box/locations/selection/select_nth_spawn_location

# Store this as the current location
scoreboard players operation #current_location mystery_box_location_id = #selected_location_id mystery_box_location_id
