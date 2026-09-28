# === INITIALIZE MYSTERY BOX LOCATION SYSTEM (UNRESTRICTED) ===
# Picks a random location marker from all locations
# This is the original behavior - fallback when no spawn locations exist

# If no locations exist, do nothing
execute unless score #total_locations mystery_box_location_id matches 1.. run return 0

# Generate random location ID (1 to total)
execute store result score #random_location mystery_box_location_id run random value 1..2147483647
scoreboard players operation #random_location mystery_box_location_id %= #total_locations mystery_box_location_id
scoreboard players add #random_location mystery_box_location_id 1

# Find the marker with that ID and mark it as active, play spawn animation
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_active 1
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_ready 0
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_last_anim 0
execute as @e[tag=mystery_box_location,type=marker] if score @s mystery_box_location_id = #random_location mystery_box_location_id at @s run function zombies:map_elements/mystery_box/animation/triggers/spawn

# Store this as the current location
scoreboard players operation #current_location mystery_box_location_id = #random_location mystery_box_location_id
