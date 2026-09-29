# === RESET MYSTERY BOX LOCATION IDS ===
# Reassigns all location marker IDs sequentially (1, 2, 3, 4...)
# Call this after placing or deleting location markers

# Clear all existing IDs and active states
scoreboard players set @e[tag=mystery_box_location,type=marker] mystery_box_location_id 0
scoreboard players set @e[tag=mystery_box_location,type=marker] mystery_box_active 0
scoreboard players set @e[tag=mystery_box_location,type=marker] mystery_box_ready 0
scoreboard players set @e[tag=mystery_box_location,type=marker] mystery_box_can_claim 0

# Reset counter
scoreboard players set #next_id mystery_box_location_id 0

# Assign sequential IDs to each marker
execute as @e[tag=mystery_box_location,type=marker] run function zbk:map_elements/mystery_box/locations/index/assign_sequential_id

# Count total locations (use #next_id since it was incremented for each marker)
scoreboard players operation #total_locations mystery_box_location_id = #next_id mystery_box_location_id

# Initialize an active location if we have any
execute if score #total_locations mystery_box_location_id matches 1.. run function zbk:map_elements/mystery_box/locations/lifecycle/init_system

# Play empty animation on all inactive boxes (delayed to run after spawn animation starts)
schedule function zbk:map_elements/mystery_box/locations/lifecycle/empty_inactive_boxes 1t
