# Phase 1: Linear interpolation from Start to Peak
# pos = start + (peak - start) * t / 50
# Executed as tracking marker

scoreboard players set #50 arc_calc 50

# X: start_x + (peak_x - start_x) * t / 50
scoreboard players operation #delta arc_calc = @s arc_peak_x
scoreboard players operation #delta arc_calc -= @s arc_start_x
scoreboard players operation #delta arc_calc *= @s arc_t
scoreboard players operation #delta arc_calc /= #50 arc_calc
scoreboard players operation @s arc_pos_x = @s arc_start_x
scoreboard players operation @s arc_pos_x += #delta arc_calc

# Y: start_y + (peak_y - start_y) * t / 50
scoreboard players operation #delta arc_calc = @s arc_peak_y
scoreboard players operation #delta arc_calc -= @s arc_start_y
scoreboard players operation #delta arc_calc *= @s arc_t
scoreboard players operation #delta arc_calc /= #50 arc_calc
scoreboard players operation @s arc_pos_y = @s arc_start_y
scoreboard players operation @s arc_pos_y += #delta arc_calc

# Z: start_z + (peak_z - start_z) * t / 50
scoreboard players operation #delta arc_calc = @s arc_peak_z
scoreboard players operation #delta arc_calc -= @s arc_start_z
scoreboard players operation #delta arc_calc *= @s arc_t
scoreboard players operation #delta arc_calc /= #50 arc_calc
scoreboard players operation @s arc_pos_z = @s arc_start_z
scoreboard players operation @s arc_pos_z += #delta arc_calc
