execute as @a[tag=cb_building] at @s run function zombies:map_elements/crafting_bench/build/tick
execute in minecraft:overworld as @e[distance=0..,type=text_display,tag=cb_progress] at @s run function zombies:map_elements/crafting_bench/display/update
execute in minecraft:the_nether as @e[distance=0..,type=text_display,tag=cb_progress] at @s run function zombies:map_elements/crafting_bench/display/update
execute in minecraft:the_end as @e[distance=0..,type=text_display,tag=cb_progress] at @s run function zombies:map_elements/crafting_bench/display/update
