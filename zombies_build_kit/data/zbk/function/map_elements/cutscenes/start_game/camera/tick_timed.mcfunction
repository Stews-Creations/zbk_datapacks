# ===================================
# START GAME CUTSCENE - TICK TIMED
# ===================================
# Counts down timer, finishes when done
# ===================================

# Decrement timer
scoreboard players remove #global cutscene_timer 1

# Timer expired - finish cutscene and start the game
execute if score #global cutscene_timer matches ..0 run function zbk:map_elements/cutscenes/start_game/flow/finish
