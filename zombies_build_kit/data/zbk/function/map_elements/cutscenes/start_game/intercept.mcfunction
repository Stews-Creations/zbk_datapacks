# ===================================
# START GAME CUTSCENE - INTERCEPT
# ===================================
# Called instead of game/management/start when start_game trigger fires
# Checks for cutscene markers and plays cutscene first if they exist
# ===================================



execute unless score #continuing zbk.api matches 1 run return run function zbk:api/game/start

# Priority 1: Timed start-game cutscene marker
execute if entity @e[type=marker,tag=cutscene_start_timed,limit=1] run return run function zbk:map_elements/cutscenes/start_game/start_timed

# Priority 2: Pan start-game cutscene markers (both must exist)
execute if entity @e[type=marker,tag=cutscene_start_start,limit=1] if entity @e[type=marker,tag=cutscene_start_finish,limit=1] run return run function zbk:map_elements/cutscenes/start_game/start_pan

# No cutscene markers - start game immediately
function zbk:game/management/start
