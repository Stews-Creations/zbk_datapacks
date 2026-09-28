# Reset Game Start pulse signals to idle
execute as @e[type=marker,tag=signal_game_start,tag=signal_pulse] at @s run setblock ~ ~ ~ yellow_concrete
