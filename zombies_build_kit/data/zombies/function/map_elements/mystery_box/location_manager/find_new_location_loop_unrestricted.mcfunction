# === FIND NEW LOCATION (LOOP - UNRESTRICTED) ===
# Generates random location from all locations until it's different from previous
# Max 10 attempts to prevent infinite loop
# This is the original behavior

# Generate random location ID (1 to total)
execute store result score #random_location mystery_box_location_id run random value 1..2147483647
scoreboard players operation #random_location mystery_box_location_id %= #total_locations mystery_box_location_id
scoreboard players add #random_location mystery_box_location_id 1

# Increment attempt counter
scoreboard players add #attempts mystery_box_location_id 1

# If random equals previous AND we haven't exceeded attempts, try again
execute if score #random_location mystery_box_location_id = #previous_location mystery_box_location_id if score #attempts mystery_box_location_id matches ..10 run return run function zombies:map_elements/mystery_box/location_manager/find_new_location_loop_unrestricted

# Found a new location (or max attempts reached)
# Activate the new location marker and play spawn animation
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_active 1
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_ready 0
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_last_anim 0
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #random_location mystery_box_location_id at @s run function zombies:map_elements/mystery_box/animation/triggers/spawn

# Store as current location
scoreboard players operation #current_location mystery_box_location_id = #random_location mystery_box_location_id
