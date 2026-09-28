# Phase 2: Peak to End
# X/Z: linear interpolation (straight line)
# Y: quadratic ease-in (stays high then drops, like gravity)
# Y formula: peak_y + (end_y - peak_y) * (t2/50)^2
# Executed as tracking marker

scoreboard players set #50 arc_calc 50
scoreboard players set #2500 arc_calc 2500

# Calculate phase 2 progress: t2 = arc_t - 50
scoreboard players operation #t2 arc_calc = @s arc_t
scoreboard players remove #t2 arc_calc 50

# X: linear - peak_x + (end_x - peak_x) * t2 / 50
scoreboard players operation #delta arc_calc = @s arc_end_x
scoreboard players operation #delta arc_calc -= @s arc_peak_x
scoreboard players operation #delta arc_calc *= #t2 arc_calc
scoreboard players operation #delta arc_calc /= #50 arc_calc
scoreboard players operation @s arc_pos_x = @s arc_peak_x
scoreboard players operation @s arc_pos_x += #delta arc_calc

# Z: linear - peak_z + (end_z - peak_z) * t2 / 50
scoreboard players operation #delta arc_calc = @s arc_end_z
scoreboard players operation #delta arc_calc -= @s arc_peak_z
scoreboard players operation #delta arc_calc *= #t2 arc_calc
scoreboard players operation #delta arc_calc /= #50 arc_calc
scoreboard players operation @s arc_pos_z = @s arc_peak_z
scoreboard players operation @s arc_pos_z += #delta arc_calc

# Y: quadratic ease-in - peak_y + (end_y - peak_y) * t2^2 / 2500
scoreboard players operation #t2_sq arc_calc = #t2 arc_calc
scoreboard players operation #t2_sq arc_calc *= #t2 arc_calc
scoreboard players operation #delta arc_calc = @s arc_end_y
scoreboard players operation #delta arc_calc -= @s arc_peak_y
scoreboard players operation #delta arc_calc *= #t2_sq arc_calc
scoreboard players operation #delta arc_calc /= #2500 arc_calc
scoreboard players operation @s arc_pos_y = @s arc_peak_y
scoreboard players operation @s arc_pos_y += #delta arc_calc
