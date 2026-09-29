# Delete the nearest game signal marker and its block
execute as @e[type=marker,tag=game_signal,distance=..5,limit=1,sort=nearest] at @s run setblock ~ ~ ~ air
kill @e[type=marker,tag=game_signal,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Game signal deleted.","color":"red"}]
