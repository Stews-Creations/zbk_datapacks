# Switch nearest game signal marker to Toggle format
tag @e[type=marker,tag=game_signal,distance=..5,limit=1,sort=nearest] remove signal_pulse
tag @e[type=marker,tag=game_signal,distance=..5,limit=1,sort=nearest] add signal_toggle
execute as @e[type=marker,tag=game_signal,distance=..5,limit=1,sort=nearest] at @s run setblock ~ ~ ~ red_concrete
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Signal set to ","color":"white"},{"text":"Toggle","color":"red"},{"text":" mode.","color":"white"}]
