# === FIND NEW LOCATION (LOOP) ===
# Generates random location until it's different from previous
# Max 10 attempts to prevent infinite loop
# Respects spawn location restrictions when unlocked = 0

# If mystery box is not yet unlocked, use spawn-only mode
execute if score #mystery_box_unlocked mystery_box_unlocked matches 0 run return run function zombies:map_elements/mystery_box/location_manager/find_new_location_loop_spawn_only

# Mystery box is unlocked - use unrestricted mode
function zombies:map_elements/mystery_box/location_manager/find_new_location_loop_unrestricted
