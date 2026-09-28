# Fire all Game Start signals
execute as @e[type=marker,tag=signal_game_start,tag=signal_pulse] at @s run setblock ~ ~ ~ redstone_block
execute as @e[type=marker,tag=signal_game_start,tag=signal_toggle] at @s run setblock ~ ~ ~ redstone_block
execute if entity @e[type=marker,tag=signal_game_start,tag=signal_pulse] run schedule function zombies:map_elements/game_signals/runtime/pulse_reset_game_start 20t
