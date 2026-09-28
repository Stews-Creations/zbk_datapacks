# === SELECTIVE FILL AIR - Y LAYER ITERATOR ===
# Iterates Y from #cd_loop_y to #cd_max_y, scanning each XZ plane

scoreboard players operation #cd_loop_z global = #cd_min_z global

# Compute storage Y for this layer
scoreboard players operation #cd_sy global = #cd_loop_y global
scoreboard players operation #cd_sy global += #cd_off_y global
execute store result storage zbk:temp fa.sy int 1 run scoreboard players get #cd_sy global
execute store result storage zbk:temp fa.y int 1 run scoreboard players get #cd_loop_y global

function zbk:map_elements/custom_door/animations/fill_air_scan_z

scoreboard players add #cd_loop_y global 1
execute if score #cd_loop_y global <= #cd_max_y global run function zbk:map_elements/custom_door/animations/fill_air_scan_y
