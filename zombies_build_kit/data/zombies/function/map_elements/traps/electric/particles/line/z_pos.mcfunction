# Directional particle line step: +Z
function zombies:map_elements/traps/electric/particles/line/spawn_column with storage minecraft:temp

scoreboard players add #line_i trap_cost 1
execute if score #line_i trap_cost <= #abs_dz trap_cost positioned ~ ~ ~1 run function zombies:map_elements/traps/electric/particles/line/z_pos
