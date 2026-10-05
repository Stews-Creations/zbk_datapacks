# Apply partial-block clearance at feet, torso, and the top of the standing body.
scoreboard players operation #rs_sample_height temp = #rs_foot_height temp
function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_point
scoreboard players add #rs_sample_height temp 900
scoreboard players operation #rs_sample_height temp %= #rs_block_unit temp
execute positioned ~ ~0.9 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_point
scoreboard players add #rs_sample_height temp 898
scoreboard players operation #rs_sample_height temp %= #rs_block_unit temp
execute positioned ~ ~1.798 ~ run function zbk:combat/weapons/special_equipment/rocket_shield/movement/probe_point
