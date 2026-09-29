# Switch nearest game signal marker to Pulse format
tag @e[type=marker,tag=game_signal,distance=..5,limit=1,sort=nearest] remove signal_toggle
tag @e[type=marker,tag=game_signal,distance=..5,limit=1,sort=nearest] add signal_pulse
execute as @e[type=marker,tag=game_signal,distance=..5,limit=1,sort=nearest] at @s run setblock ~ ~ ~ yellow_concrete
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Signal set to ","color":"white"},{"text":"Pulse","color":"yellow"},{"text":" mode.","color":"white"}]
