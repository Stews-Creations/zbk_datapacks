# ===================================
# SPAWN MENU - MENU MUSIC CLICK HANDLER
# ===================================
# Called when player shoots Menu Music option (from gun raycast)

# Play click sound to all nearby players
playsound minecraft:ui.button.click master @a[distance=..10] ~ ~ ~ 1 1

# Toggle music for the shooting player
execute as @p[tag=raycasting] run function zbk:build_kit/spawn_menu/music/toggle_menu_music
