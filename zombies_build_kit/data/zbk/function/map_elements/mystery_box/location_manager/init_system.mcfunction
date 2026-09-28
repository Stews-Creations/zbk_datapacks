# === INITIALIZE MYSTERY BOX LOCATION SYSTEM ===
# Picks a random location marker and marks it as active
# Respects spawn location restrictions when unlocked = 0

# If mystery box is not yet unlocked, use spawn-only mode
execute if score #mystery_box_unlocked mystery_box_unlocked matches 0 run return run function zbk:map_elements/mystery_box/location_manager/init_system_spawn_only

# Mystery box is unlocked - use unrestricted mode
function zbk:map_elements/mystery_box/location_manager/init_system_unrestricted
