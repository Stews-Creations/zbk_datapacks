# ===================================
# SPAWN MENU - BUILD KIT CLICK HANDLER
# ===================================
# Called when player shoots Build Kit option (from gun raycast)

# Play click sound to all nearby players
playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1

# Give build kit items to the shooting player
execute as @p[tag=raycasting] run function zbk:build_kit/spawn_menu/handlers/give_build_kit_items
