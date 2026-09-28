# Fire all Game End signals (pulse only)
execute as @e[type=marker,tag=signal_game_end,tag=signal_pulse] at @s run setblock ~ ~ ~ redstone_block
execute if entity @e[type=marker,tag=signal_game_end,tag=signal_pulse] run schedule function zombies:map_elements/game_signals/runtime/pulse_reset_game_end 20t
