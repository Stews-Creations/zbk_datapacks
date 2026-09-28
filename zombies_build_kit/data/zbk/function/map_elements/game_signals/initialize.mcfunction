# ===================================
# GAME SIGNALS - INITIALIZE
# ===================================
# Purpose: Reset all game signal markers to idle state
# Called from game/initialize.mcfunction on game end/reset

# Reset all pulse signals to idle (yellow concrete)
execute as @e[type=marker,tag=game_signal,tag=signal_pulse] at @s run setblock ~ ~ ~ yellow_concrete

# Reset all toggle signals to OFF (red concrete)
execute as @e[type=marker,tag=game_signal,tag=signal_toggle] at @s run setblock ~ ~ ~ red_concrete
