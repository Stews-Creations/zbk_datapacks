# Room-wide activation state, plate charge, and repeating-cycle timers.
scoreboard objectives add de_ag_state dummy
scoreboard objectives add de_ag_jump_t dummy
scoreboard objectives add de_ag_plate_t dummy
scoreboard objectives add de_ag_cycle dummy
scoreboard objectives add de_ag_motion dummy
scoreboard objectives add de_ag_wall_x dummy
scoreboard objectives add de_ag_wall_z dummy
scoreboard objectives add de_ag_wall_life dummy
scoreboard objectives add de_ag_bound_y dummy
scoreboard objectives add de_ag_bound_rise dummy
scoreboard objectives add de_ag_bound_cd dummy
function zbk_der_eisendrache:anti_gravity/boundary/cleanup

# Refresh named modifiers after datapack updates; active eligible players reapply next tick.
execute as @a[tag=de_ag_effects] at @s run function zbk_der_eisendrache:anti_gravity/movement/remove
# Retired mob effects are removed only during load/reset, with no mob tick loop.
execute as @e[tag=de_ag_mob_effects] run function zbk_der_eisendrache:anti_gravity/management/clear_mob_effects
tag @e[tag=de_ag_mob_near] remove de_ag_mob_near
tag @a remove de_ag_wall_moving
tag @a remove de_ag_wall_supported
tag @a remove de_ag_wall_pos_init
function zbk_der_eisendrache:anti_gravity/wall_run/platform/cleanup_all
