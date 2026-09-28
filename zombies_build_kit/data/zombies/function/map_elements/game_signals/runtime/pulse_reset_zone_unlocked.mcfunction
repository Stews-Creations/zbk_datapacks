# Reset Zone Unlocked pulse signals to idle
execute as @e[type=marker,tag=signal_zone_unlocked,tag=signal_pulse] at @s run setblock ~ ~ ~ yellow_concrete
