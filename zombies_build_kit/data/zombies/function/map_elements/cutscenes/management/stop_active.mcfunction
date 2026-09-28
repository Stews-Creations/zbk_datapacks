# ===================================
# CUTSCENES - STOP ACTIVE
# ===================================
# Clears any active cutscene state without starting another flow.
# Callers can continue into game start, game over, or reload reset after this.
# ===================================

# If players were forced into spectator by a cutscene, release them before clearing state.
execute if score #global cutscene_active matches 1.. run gamemode adventure @a

schedule clear zombies:map_elements/cutscenes/start_game/spectate
schedule clear zombies:map_elements/cutscenes/end_game/spectate

# Clear cutscene state and remove temporary camera entities.
scoreboard players set #global cutscene_active 0
scoreboard players set #global cutscene_timer 0
kill @e[type=armor_stand,tag=cutscene_camera,tag=!intro_cutscene]

function zbk:dispatch/cutscene_stop
