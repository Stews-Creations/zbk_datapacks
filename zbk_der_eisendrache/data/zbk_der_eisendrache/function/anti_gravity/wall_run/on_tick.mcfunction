# Rebuild horizontal movement state, create the forward row for moving players, then retire unused blocks.
tag @a remove de_ag_wall_moving
tag @a remove de_ag_wall_supported
tag @e[type=minecraft:marker,tag=de_ag_wall_platform] remove de_ag_wall_platform_keep
execute unless score #room de_ag_state matches 1 run tag @a remove de_ag_wall_pos_init
tag @a[tag=!de_ag_inside] remove de_ag_wall_pos_init
tag @a[tag=de_ag_suppressed] remove de_ag_wall_pos_init
execute if score #room de_ag_state matches 1 as @a[tag=de_ag_inside,tag=!de_ag_suppressed] at @s run function zbk_der_eisendrache:anti_gravity/wall_run/player/update_movement
execute if score #room de_ag_state matches 1 as @a[tag=de_ag_inside,tag=!de_ag_suppressed,tag=de_ag_wall_moving] at @s run function zbk_der_eisendrache:anti_gravity/wall_run/detection/scan
execute as @e[type=minecraft:marker,tag=de_ag_wall_platform] at @s run function zbk_der_eisendrache:anti_gravity/wall_run/platform/tick
execute if score #room de_ag_state matches 1 as @a[tag=de_ag_inside,tag=!de_ag_suppressed] at @s run function zbk_der_eisendrache:anti_gravity/wall_run/player/check_support
execute as @a[tag=de_ag_wall_supported] run attribute @s minecraft:movement_speed base set 0.1
