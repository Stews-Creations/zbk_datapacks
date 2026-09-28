execute as @a[tag=cb_building] run function zbk:map_elements/crafting_bench/build/cancel
execute in minecraft:overworld run kill @e[tag=cb_runtime]
execute in minecraft:the_nether run kill @e[tag=cb_runtime]
execute in minecraft:the_end run kill @e[tag=cb_runtime]
function zbk:map_elements/crafting_bench/management/maintenance
