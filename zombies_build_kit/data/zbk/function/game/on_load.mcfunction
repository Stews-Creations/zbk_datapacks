# ===================================
# GAME MODULE - LOAD
# ===================================
# Purpose: Initialize game state management
# ===================================

# Book trigger scoreboards
scoreboard objectives add give_spawn_point trigger
scoreboard objectives add give_worldspawn trigger
scoreboard objectives add start_game trigger
scoreboard objectives add reset_game trigger
scoreboard objectives add start_no_cutscene trigger
scoreboard objectives add stop_no_cutscene trigger

scoreboard objectives add tp_worldspawn trigger

# Helper scoreboards for dialog reopening
scoreboard objectives add start_game_opener dummy
scoreboard objectives add reset_game_opener dummy
scoreboard objectives add game.start_round dummy
execute unless score #global game.start_round matches 1.. run scoreboard players set #global game.start_round 1

# Spawn point round-robin distribution scoreboards
scoreboard objectives add spawn_point_id dummy
scoreboard objectives add spawn_point_idx dummy
