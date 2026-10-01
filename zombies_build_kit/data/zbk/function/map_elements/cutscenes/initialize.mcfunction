# ===================================
# CUTSCENES MODULE - INITIALIZE
# ===================================
# Purpose: Reset cutscene state on game reset
# ===================================

# Deactivate cutscene
scoreboard players set #global cutscene_active 0
schedule clear zbk:map_elements/cutscenes/start_game/camera/spectate
schedule clear zbk:map_elements/cutscenes/end_game/camera/spectate

# Kill any leftover camera entities
kill @e[type=armor_stand,tag=cutscene_camera]
