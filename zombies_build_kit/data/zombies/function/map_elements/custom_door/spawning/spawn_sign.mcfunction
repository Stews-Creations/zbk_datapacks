# ===================================
# CUSTOM DOOR - SPAWN SIGN MARKER FROM ENDERMITE
# ===================================
# Runs as the detected endermite, at its position. Creates sign marker + interaction + text display.
# Snaps to block center.

# Place everything at the endermite's block center
execute align xyz positioned ~0.5 ~ ~0.5 run function zombies:map_elements/custom_door/spawning/spawn_sign_place

# Kill the endermite
kill @s
