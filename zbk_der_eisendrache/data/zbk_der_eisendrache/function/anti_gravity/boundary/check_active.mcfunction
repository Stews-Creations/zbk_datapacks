# A short apex grace and an air jump that has just started must not be interrupted.
execute if score @s de_ag_bound_rise matches 1.. run return 0
execute if score @s de_ag_jump_t matches 1.. run return 0

# Wall-run support was checked after platform updates earlier this tick.
execute if entity @s[tag=de_ag_wall_supported] run return 0
function zbk_der_eisendrache:anti_gravity/boundary/recover
