scoreboard players operation #rs_delete rs_candidate = @s rs_candidate
execute as @e[tag=rs_part_runtime] if score @s rs_candidate = #rs_delete rs_candidate run kill @s
execute if entity @s[tag=rs_plate_candidate] run data modify storage zbk:shield_parts deletion.part set value "plate"
execute if entity @s[tag=rs_mechanism_candidate] run data modify storage zbk:shield_parts deletion.part set value "mechanism"
execute if entity @s[tag=rs_rocket_candidate] run data modify storage zbk:shield_parts deletion.part set value "rocket"
execute store result storage zbk:shield_parts deletion.id int 1 run scoreboard players get @s rs_candidate
function zbk:map_elements/rocket_shield/management/delete_registry with storage zbk:shield_parts deletion
kill @s
