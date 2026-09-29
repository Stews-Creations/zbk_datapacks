# === FIND NEW LOCATION (LOOP - SPAWN ONLY) ===
# Generates random location from spawn locations until it's different from previous
# Max 10 attempts to prevent infinite loop

# Count spawn locations
function zbk:map_elements/mystery_box/locations/index/count_spawn_locations

# If no spawn locations exist, fallback to unrestricted search
execute unless score #total_spawn_locations mystery_box_location_id matches 1.. run return run function zbk:map_elements/mystery_box/locations/selection/find_new_location_loop_unrestricted

# Generate random location index (1 to total spawn locations)
execute store result score #random_location mystery_box_location_id run random value 1..2147483647
scoreboard players operation #random_location mystery_box_location_id %= #total_spawn_locations mystery_box_location_id
scoreboard players add #random_location mystery_box_location_id 1

# Increment attempt counter
scoreboard players add #attempts mystery_box_location_id 1

# Get the actual location ID of the Nth spawn location
scoreboard players set #spawn_index mystery_box_location_id 0
scoreboard players set #selected_location_id mystery_box_location_id 0
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_spawn_location=1}] run function zbk:map_elements/mystery_box/locations/index/get_nth_spawn_location_id

# If selected location equals previous AND we haven't exceeded attempts, try again
execute if score #selected_location_id mystery_box_location_id = #previous_location mystery_box_location_id if score #attempts mystery_box_location_id matches ..10 run return run function zbk:map_elements/mystery_box/locations/selection/find_new_location_loop_spawn_only

# Found a new location (or max attempts reached)
# Activate the selected spawn location
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #selected_location_id mystery_box_location_id run scoreboard players set @s mystery_box_active 1
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #selected_location_id mystery_box_location_id run scoreboard players set @s mystery_box_ready 0
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #selected_location_id mystery_box_location_id run scoreboard players set @s mystery_box_last_anim 0
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #selected_location_id mystery_box_location_id at @s run function zbk:map_elements/mystery_box/animation/triggers/spawn

# Store as current location
scoreboard players operation #current_location mystery_box_location_id = #selected_location_id mystery_box_location_id
