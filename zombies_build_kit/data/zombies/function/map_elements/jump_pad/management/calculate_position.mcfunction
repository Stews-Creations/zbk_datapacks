# Calculate Bezier curve position for current arc_t value
# Executed as tracking marker with arc data

scoreboard players set #100 arc_calc 100
scoreboard players set #10000 arc_calc 10000

# Calculate (1-t) = 100 - arc_t
scoreboard players operation #inv_t arc_calc = #100 arc_calc
scoreboard players operation #inv_t arc_calc -= @s arc_t

# Term 1: (1-t)² * start / 10000
scoreboard players operation #term1 arc_calc = #inv_t arc_calc
scoreboard players operation #term1 arc_calc *= #inv_t arc_calc

# X coordinate - Term 1
scoreboard players operation #x1 arc_calc = #term1 arc_calc
scoreboard players operation #x1 arc_calc *= @s arc_start_x
scoreboard players operation #x1 arc_calc /= #10000 arc_calc

# Y coordinate - Term 1
scoreboard players operation #y1 arc_calc = #term1 arc_calc
scoreboard players operation #y1 arc_calc *= @s arc_start_y
scoreboard players operation #y1 arc_calc /= #10000 arc_calc

# Z coordinate - Term 1
scoreboard players operation #z1 arc_calc = #term1 arc_calc
scoreboard players operation #z1 arc_calc *= @s arc_start_z
scoreboard players operation #z1 arc_calc /= #10000 arc_calc

# Term 2: 2 * (1-t) * t * peak / 10000
scoreboard players set #2 arc_calc 2
scoreboard players operation #term2 arc_calc = #2 arc_calc
scoreboard players operation #term2 arc_calc *= #inv_t arc_calc
scoreboard players operation #term2 arc_calc *= @s arc_t

# X coordinate - Term 2
scoreboard players operation #x2 arc_calc = #term2 arc_calc
scoreboard players operation #x2 arc_calc *= @s arc_peak_x
scoreboard players operation #x2 arc_calc /= #10000 arc_calc

# Y coordinate - Term 2
scoreboard players operation #y2 arc_calc = #term2 arc_calc
scoreboard players operation #y2 arc_calc *= @s arc_peak_y
scoreboard players operation #y2 arc_calc /= #10000 arc_calc

# Z coordinate - Term 2
scoreboard players operation #z2 arc_calc = #term2 arc_calc
scoreboard players operation #z2 arc_calc *= @s arc_peak_z
scoreboard players operation #z2 arc_calc /= #10000 arc_calc

# Term 3: t² * end / 10000
scoreboard players operation #term3 arc_calc = @s arc_t
scoreboard players operation #term3 arc_calc *= @s arc_t

# X coordinate - Term 3
scoreboard players operation #x3 arc_calc = #term3 arc_calc
scoreboard players operation #x3 arc_calc *= @s arc_end_x
scoreboard players operation #x3 arc_calc /= #10000 arc_calc

# Y coordinate - Term 3
scoreboard players operation #y3 arc_calc = #term3 arc_calc
scoreboard players operation #y3 arc_calc *= @s arc_end_y
scoreboard players operation #y3 arc_calc /= #10000 arc_calc

# Z coordinate - Term 3
scoreboard players operation #z3 arc_calc = #term3 arc_calc
scoreboard players operation #z3 arc_calc *= @s arc_end_z
scoreboard players operation #z3 arc_calc /= #10000 arc_calc

# Sum all terms for final position (scaled by 1000)
scoreboard players operation @s arc_pos_x = #x1 arc_calc
scoreboard players operation @s arc_pos_x += #x2 arc_calc
scoreboard players operation @s arc_pos_x += #x3 arc_calc

scoreboard players operation @s arc_pos_y = #y1 arc_calc
scoreboard players operation @s arc_pos_y += #y2 arc_calc
scoreboard players operation @s arc_pos_y += #y3 arc_calc

scoreboard players operation @s arc_pos_z = #z1 arc_calc
scoreboard players operation @s arc_pos_z += #z2 arc_calc
scoreboard players operation @s arc_pos_z += #z3 arc_calc
