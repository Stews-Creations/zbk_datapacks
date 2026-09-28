execute if score @s cb_recipe matches 1 unless score #shield cb_build matches 1 run return run function zbk:map_elements/crafting_bench/build/cancel
execute if score @s cb_recipe matches 2 unless score #ragnarok cb_build matches 1 run return run function zbk:map_elements/crafting_bench/build/cancel
execute if score @s cb_recipe matches 1 run function zbk:map_elements/crafting_bench/management/complete_shield
execute if score @s cb_recipe matches 2 run function zbk:map_elements/crafting_bench/management/mark_built {recipe:"ragnarok"}
function zbk:map_elements/crafting_bench/build/cancel
