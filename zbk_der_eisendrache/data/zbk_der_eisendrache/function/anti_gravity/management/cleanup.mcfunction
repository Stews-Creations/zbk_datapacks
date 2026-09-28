# Clear all transient anti-gravity player state without deleting portal configuration.
schedule clear zbk_der_eisendrache:anti_gravity/management/finish_deactivate
function zbk_der_eisendrache:anti_gravity/audio/cleanup
execute as @a[tag=de_ag_inside] run function zbk_der_eisendrache:anti_gravity/state/exit
execute as @a[tag=de_ag_effects] run function zbk_der_eisendrache:anti_gravity/movement/remove
execute as @e[tag=de_ag_mob_effects] run function zbk_der_eisendrache:anti_gravity/management/clear_mob_effects
execute as @a[scores={de_ag_jump_t=1..}] run function zbk_der_eisendrache:anti_gravity/double_jump/reset
tag @a remove de_ag_suppressed
tag @a remove de_ag_air_jump_ready
tag @a remove de_ag_sneak_held
tag @a remove de_ag_wall_moving
tag @a remove de_ag_wall_supported
tag @a remove de_ag_wall_pos_init
tag @e[tag=de_ag_mob_near] remove de_ag_mob_near
scoreboard players set #room de_ag_state 0
scoreboard players set #stopping de_ag_cycle 0
scoreboard players set #unlocked de_ag_cycle 0
scoreboard players set #timer de_ag_cycle 0
scoreboard players set @e[type=minecraft:marker,tag=de_ag_plate] de_ag_plate_t 0
execute as @e[type=minecraft:marker,tag=de_ag_plate] at @s if block ~ ~-1 ~ minecraft:redstone_lamp run setblock ~ ~-1 ~ minecraft:redstone_lamp[lit=false]
tag @e[type=minecraft:marker,tag=de_ag_plate] remove de_ag_plate_complete
function zbk_der_eisendrache:anti_gravity/wall_run/platform/cleanup_all
function zbk_der_eisendrache:anti_gravity/boundary/cleanup
