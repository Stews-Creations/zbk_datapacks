# === SELECT NTH SPAWN LOCATION ===
# Runs as each spawn location marker
# Increments counter and activates when counter matches random selection

# Increment the spawn index
scoreboard players add #spawn_index mystery_box_location_id 1

# If this is the selected index, activate this location
execute if score #spawn_index mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_active 1
execute if score #spawn_index mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_ready 0
execute if score #spawn_index mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players set @s mystery_box_last_anim 0
execute if score #spawn_index mystery_box_location_id = #random_location mystery_box_location_id at @s run function zbk:map_elements/mystery_box/animation/triggers/spawn
execute if score #spawn_index mystery_box_location_id = #random_location mystery_box_location_id run scoreboard players operation #selected_location_id mystery_box_location_id = @s mystery_box_location_id
