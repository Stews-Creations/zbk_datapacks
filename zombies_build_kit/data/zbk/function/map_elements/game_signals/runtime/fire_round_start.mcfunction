# Fire all Round Start signals (pulse only)
execute as @e[type=marker,tag=signal_round_start,tag=signal_pulse] at @s run setblock ~ ~ ~ redstone_block
execute if entity @e[type=marker,tag=signal_round_start,tag=signal_pulse] run schedule function zbk:map_elements/game_signals/runtime/pulse_reset_round_start 20t
