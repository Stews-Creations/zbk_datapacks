# The player collision box is world-aligned, independent of view yaw.
# Sample just inside its boundary so touching a wall is not overlap.
execute positioned ~0 ~ ~0 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
execute positioned ~-0.299 ~ ~-0.299 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
execute positioned ~-0.299 ~ ~0.299 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
execute positioned ~0.299 ~ ~-0.299 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
execute positioned ~0.299 ~ ~0.299 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
execute positioned ~-0.299 ~ ~0 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
execute positioned ~0.299 ~ ~0 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
execute positioned ~0 ~ ~-0.299 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
execute positioned ~0 ~ ~0.299 run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_sample
