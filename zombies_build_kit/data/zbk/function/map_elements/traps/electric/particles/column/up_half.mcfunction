# Column step upward (+Y) in 0.5-block increments for continuous line visuals.
# Tuned for readability without over-bright clutter.
particle end_rod ~ ~ ~ 0.02 0.10 0.02 0 4 normal
particle dust{color:[0.290,0.455,1.000],scale:0.9} ~ ~ ~ 0.02 0.10 0.02 0 5 normal
particle electric_spark ~ ~ ~ 0.02 0.10 0.02 0 2 normal

scoreboard players add #col_i trap_cost 1
execute if score #col_i trap_cost <= #line_half_steps trap_cost positioned ~ ~0.5 ~ run function zbk:map_elements/traps/electric/particles/column/up_half
