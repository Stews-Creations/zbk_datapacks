# Authoring remains available outside an active game; gameplay gates belong to the owning runtime command.

# ===================================
# BUILD KIT MODULE - TICK
# ===================================
# Runs every game tick for build kit trigger processing

# Process build kit trigger commands (admin tools, spawn eggs, etc.)
function zbk:build_kit/management/triggers

# Display zone particles if highlight is active
execute if score #highlight_zone global matches 0.. run function zbk:build_kit/management/zones/display_zone_particles

# Run spawn menu hover detection when game isn't started and no cutscene is active.
execute if score #global game_active matches 0 unless score #global cutscene_active matches 1.. if entity @e[type=text_display,tag=spawn_menu] run function zbk:build_kit/spawn_menu/hover/detect_hover

# Play menu music if enabled, players are near, and no cutscene is active.
execute if score #global game_active matches 0 unless score #global cutscene_active matches 1.. if entity @e[type=text_display,tag=spawn_menu] run function zbk:build_kit/spawn_menu/music/play_menu_music
