# Fire all Cutscene End Game signals (pulse only)
execute as @e[type=marker,tag=signal_cutscene_end,tag=signal_pulse] at @s run setblock ~ ~ ~ redstone_block
execute if entity @e[type=marker,tag=signal_cutscene_end,tag=signal_pulse] run schedule function zombies:map_elements/game_signals/runtime/pulse_reset_cutscene_end 20t
