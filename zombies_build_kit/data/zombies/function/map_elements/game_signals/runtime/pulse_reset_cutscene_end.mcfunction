# Reset Cutscene End Game pulse signals to idle
execute as @e[type=marker,tag=signal_cutscene_end,tag=signal_pulse] at @s run setblock ~ ~ ~ yellow_concrete
