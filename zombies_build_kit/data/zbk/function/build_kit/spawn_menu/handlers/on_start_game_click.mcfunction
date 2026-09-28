# ===================================
# SPAWN MENU - START GAME CLICK HANDLER
# ===================================
# Called when player shoots Start Game option (from gun raycast)

# Play click sound to all nearby players
playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1

# Start the game (through cutscene intercept - plays cutscene if one exists)
execute as @p[tag=raycasting] run function zbk:game/management/custom_start/reset
execute as @p[tag=raycasting] run function zbk:map_elements/cutscenes/start_game/intercept
