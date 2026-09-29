# === DELETE BLOCK POWER LAMP MARKER ===
# Removes nearest marker and its lamp block if present.

execute as @e[type=marker,tag=block_power_lamp_marker,distance=..5,limit=1,sort=nearest] at @s run setblock ~ ~ ~ minecraft:air destroy
kill @e[type=marker,tag=block_power_lamp_marker,distance=..5,limit=1,sort=nearest]
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Power lamp marker deleted.","color":"red"}]
