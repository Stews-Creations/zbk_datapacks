# Validate the whole standing footprint, including positions straddling block edges.
scoreboard players set #bound_clear de_ag_motion 1
execute positioned ~-0.3 ~ ~-0.3 run function zbk_der_eisendrache:anti_gravity/validation/recovery_column
execute positioned ~-0.3 ~ ~0.3 run function zbk_der_eisendrache:anti_gravity/validation/recovery_column
execute positioned ~0.3 ~ ~-0.3 run function zbk_der_eisendrache:anti_gravity/validation/recovery_column
execute positioned ~0.3 ~ ~0.3 run function zbk_der_eisendrache:anti_gravity/validation/recovery_column
execute unless score #bound_clear de_ag_motion matches 1 run return 0

# Reject unsupported destinations and temporary wall-run collision. Builders must choose solid, safe footing.
execute if block ~ ~-0.01 ~ #zbk_der_eisendrache:de_ag_recovery_clearance run return 0
execute if block ~ ~-0.01 ~ minecraft:water run return 0
execute if block ~ ~-0.01 ~ minecraft:lava run return 0
execute if block ~ ~-0.01 ~ minecraft:powder_snow run return 0
execute if block ~ ~-0.01 ~ minecraft:structure_void run return 0
execute if block ~ ~-0.01 ~ minecraft:barrier run return 0
return 1
