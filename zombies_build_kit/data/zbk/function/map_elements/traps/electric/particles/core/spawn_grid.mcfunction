# === SPAWN PARTICLE GRID ===
# Spawns electric particles along the dominant axis between trap markers.

scoreboard players operation #abs_dx trap_cost = #dx trap_cost
scoreboard players operation #abs_dz trap_cost = #dz trap_cost
scoreboard players operation #abs_dy trap_cost = #dy trap_cost
scoreboard players set #-1 trap_cost -1
scoreboard players set #2 trap_cost 2

scoreboard players set #x_dir trap_cost 0
execute if score #dx trap_cost matches 1.. run scoreboard players set #x_dir trap_cost 1
execute if score #dx trap_cost matches ..-1 run scoreboard players set #x_dir trap_cost -1

scoreboard players set #z_dir trap_cost 0
execute if score #dz trap_cost matches 1.. run scoreboard players set #z_dir trap_cost 1
execute if score #dz trap_cost matches ..-1 run scoreboard players set #z_dir trap_cost -1

execute if score #abs_dx trap_cost matches ..-1 run scoreboard players operation #abs_dx trap_cost *= #-1 trap_cost
execute if score #abs_dz trap_cost matches ..-1 run scoreboard players operation #abs_dz trap_cost *= #-1 trap_cost
execute if score #abs_dy trap_cost matches ..-1 run scoreboard players operation #abs_dy trap_cost *= #-1 trap_cost

# Stable vertical midpoint from integer corner scores (marker Y is block + 0.5).
scoreboard players operation #y_center_2 trap_cost = #y1 trap_cost
scoreboard players operation #y_center_2 trap_cost += #y2 trap_cost
scoreboard players add #y_center_2 trap_cost 1

# Exact half-height for center +/- N slices.
scoreboard players operation #line_half_dy trap_cost = #abs_dy trap_cost
scoreboard players operation #line_half_dy trap_cost /= #2 trap_cost
scoreboard players operation #line_half_steps trap_cost = #line_half_dy trap_cost
scoreboard players operation #line_half_steps trap_cost *= #2 trap_cost

# Store center for macro-based line column spawns.
execute store result storage minecraft:temp y_center double 0.5 run scoreboard players get #y_center_2 trap_cost

# Debug helper: effective block span from center +/- half.
scoreboard players operation #span_blocks trap_cost = #line_half_dy trap_cost
scoreboard players add #span_blocks trap_cost 1
scoreboard players operation #span_blocks trap_cost *= #2 trap_cost
scoreboard players remove #span_blocks trap_cost 1

# Spawn on dominant horizontal axis from marker position directly.
execute if score #abs_dx trap_cost >= #abs_dz trap_cost run scoreboard players set #line_i trap_cost 0
execute if score #abs_dx trap_cost >= #abs_dz trap_cost if score #x_dir trap_cost matches 1 run function zbk:map_elements/traps/electric/particles/line/x_pos
execute if score #abs_dx trap_cost >= #abs_dz trap_cost if score #x_dir trap_cost matches -1 run function zbk:map_elements/traps/electric/particles/line/x_neg

execute if score #abs_dz trap_cost > #abs_dx trap_cost run scoreboard players set #line_i trap_cost 0
execute if score #abs_dz trap_cost > #abs_dx trap_cost if score #z_dir trap_cost matches 1 run function zbk:map_elements/traps/electric/particles/line/z_pos
execute if score #abs_dz trap_cost > #abs_dx trap_cost if score #z_dir trap_cost matches -1 run function zbk:map_elements/traps/electric/particles/line/z_neg
