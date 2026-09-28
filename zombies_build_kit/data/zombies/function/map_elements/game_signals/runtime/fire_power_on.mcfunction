# Fire all Power On signals
execute as @e[type=marker,tag=signal_power_on,tag=signal_pulse] at @s run setblock ~ ~ ~ redstone_block
execute as @e[type=marker,tag=signal_power_on,tag=signal_toggle] at @s run setblock ~ ~ ~ redstone_block
execute if entity @e[type=marker,tag=signal_power_on,tag=signal_pulse] run schedule function zombies:map_elements/game_signals/runtime/pulse_reset_power_on 20t
