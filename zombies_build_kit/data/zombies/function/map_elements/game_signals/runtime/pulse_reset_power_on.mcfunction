# Reset Power On pulse signals to idle
execute as @e[type=marker,tag=signal_power_on,tag=signal_pulse] at @s run setblock ~ ~ ~ yellow_concrete
