# Reset Game End pulse signals to idle
execute as @e[type=marker,tag=signal_game_end,tag=signal_pulse] at @s run setblock ~ ~ ~ yellow_concrete
