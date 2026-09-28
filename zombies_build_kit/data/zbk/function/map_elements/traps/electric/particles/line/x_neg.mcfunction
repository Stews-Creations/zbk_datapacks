# Directional particle line step: -X
function zbk:map_elements/traps/electric/particles/line/spawn_column with storage minecraft:temp

scoreboard players add #line_i trap_cost 1
execute if score #line_i trap_cost <= #abs_dx trap_cost positioned ~-1 ~ ~ run function zbk:map_elements/traps/electric/particles/line/x_neg
