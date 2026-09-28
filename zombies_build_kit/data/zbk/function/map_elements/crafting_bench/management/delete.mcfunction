# Authoritative marker context; delete only this location and its linked runtime.
scoreboard players operation #bench_delete cb_id = @s cb_id
execute as @a[tag=cb_building] if score @s cb_target = #bench_delete cb_id at @s run function zbk:map_elements/crafting_bench/build/cancel
execute as @e[tag=cb_runtime] if score @s cb_id = #bench_delete cb_id run kill @s
execute if score #shield_bench cb_id = #bench_delete cb_id run scoreboard players set #shield cb_build 0
execute if score #shield_bench cb_id = #bench_delete cb_id run scoreboard players set #shield_bench cb_id 0
function zbk:map_elements/crafting_bench/management/check_ready
kill @s
