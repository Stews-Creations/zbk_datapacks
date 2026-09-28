# === COUNT SPAWN LOCATIONS ===
# Counts how many mystery box locations are tagged as spawn locations
# Stores result in #total_spawn_locations

# Reset counter
scoreboard players set #total_spawn_locations mystery_box_location_id 0

# Count all markers tagged as spawn locations
execute as @e[tag=mystery_box_location,type=marker,scores={mystery_box_spawn_location=1}] run scoreboard players add #total_spawn_locations mystery_box_location_id 1
