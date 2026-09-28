# Set all block power lamp markers to unlit.
execute as @e[type=marker,tag=block_power_lamp_marker] at @s run setblock ~ ~ ~ minecraft:redstone_lamp[lit=false]
