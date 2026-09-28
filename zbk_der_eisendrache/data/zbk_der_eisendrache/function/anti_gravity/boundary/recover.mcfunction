# Use only the nearest local destination; never fall through to a distant marker.
scoreboard players set @s de_ag_bound_cd 20
execute unless entity @e[type=minecraft:marker,tag=de_ag_recovery,distance=..32] run return run function zbk_der_eisendrache:anti_gravity/boundary/missing_destination
execute store result score #bound_valid de_ag_motion positioned as @e[type=minecraft:marker,tag=de_ag_recovery,distance=..32,sort=nearest,limit=1] run function zbk_der_eisendrache:anti_gravity/validation/recovery_destination
execute unless score #bound_valid de_ag_motion matches 1 run return run function zbk_der_eisendrache:anti_gravity/boundary/missing_destination

# Position changes, but execution rotation remains the player's own yaw and pitch.
execute positioned as @e[type=minecraft:marker,tag=de_ag_recovery,distance=..32,sort=nearest,limit=1] run tp @s ~ ~ ~ ~ ~
function zbk_der_eisendrache:anti_gravity/boundary/reset_sample
execute if entity @s[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Returned to the nearest recovery marker.","color":"yellow"}]
