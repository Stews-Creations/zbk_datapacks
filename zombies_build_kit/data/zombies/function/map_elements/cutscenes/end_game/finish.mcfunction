# ===================================
# END GAME CUTSCENE - FINISH
# ===================================
# Purpose: End the cutscene, return players to lobby
# ===================================

# Deactivate cutscene first to stop tick
scoreboard players set #global cutscene_active 0

# Teleport all players to worldspawn
execute as @a run function zombies:game/management/worldspawn/teleport

# Force all players back to adventure mode
gamemode adventure @a

# Kill the cutscene camera
kill @e[type=armor_stand,tag=cutscene_camera]

# Reset the game
function zombies:game/initialize

# Fire game end signals AFTER initialize
function zombies:map_elements/game_signals/runtime/fire_game_end
