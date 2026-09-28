# Fire all Cutscene Start Game signals (pulse only)
execute as @e[type=marker,tag=signal_cutscene_start,tag=signal_pulse] at @s run setblock ~ ~ ~ redstone_block
execute if entity @e[type=marker,tag=signal_cutscene_start,tag=signal_pulse] run schedule function zombies:map_elements/game_signals/runtime/pulse_reset_cutscene_start 20t
