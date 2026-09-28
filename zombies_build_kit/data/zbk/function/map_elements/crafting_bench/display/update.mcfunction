# Text display context. Show the furthest active builder on this exact bench.
scoreboard players operation #bar_owner cb_id = @s cb_id
scoreboard players set #progress cb_time -1
execute as @a[tag=cb_building,distance=..10] if score @s cb_target = #bar_owner cb_id run scoreboard players operation #progress cb_time > @s cb_time
execute if score #progress cb_time matches -1 run return run kill @s
function zbk:map_elements/crafting_bench/display/apply_progress
