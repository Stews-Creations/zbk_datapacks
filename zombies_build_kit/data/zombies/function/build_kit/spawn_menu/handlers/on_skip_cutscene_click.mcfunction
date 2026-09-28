# ===================================
# SPAWN MENU - START (NO CUTSCENE) CLICK HANDLER
# ===================================
# Called when player shoots Start (No Cutscene) option (from gun raycast)

# Play click sound to all nearby players
playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1

# Start the game directly (bypasses cutscene intercept)
execute as @p[tag=raycasting] run function zombies:game/management/custom_start/reset
execute as @p[tag=raycasting] run function zombies:game/management/start
