# Remove current barrier collision or gold left by the previous prototype.
execute if block ~ ~ ~ minecraft:barrier run setblock ~ ~ ~ minecraft:air
execute if block ~ ~ ~ minecraft:gold_block run setblock ~ ~ ~ minecraft:air
kill @s
