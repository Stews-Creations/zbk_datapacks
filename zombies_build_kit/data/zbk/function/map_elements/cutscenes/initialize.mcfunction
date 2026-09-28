# ===================================
# CUTSCENES MODULE - INITIALIZE
# ===================================
# Purpose: Reset cutscene state on game reset
# ===================================

# Deactivate cutscene
scoreboard players set #global cutscene_active 0

# Kill any leftover camera entities
kill @e[type=armor_stand,tag=cutscene_camera]
