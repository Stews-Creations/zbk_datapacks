# ===================================
# START GAME CUTSCENE - FINISH
# ===================================
# Camera reached end - kill it and start the actual game
# ===================================

# Deactivate cutscene
scoreboard players set #global cutscene_active 0

# Kill the cutscene camera
kill @e[type=armor_stand,tag=cutscene_start_camera]

# Start the actual game
function zbk:game/continue_immediate
