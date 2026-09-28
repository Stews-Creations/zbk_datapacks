# Keep the platform while an eligible anti-gravity player remains nearby.
execute unless score #room de_ag_state matches 1 run function zbk_der_eisendrache:anti_gravity/wall_run/platform/remove
execute unless score #room de_ag_state matches 1 run return 0
execute if entity @s[tag=de_ag_wall_platform_keep] run scoreboard players set @s de_ag_wall_life 3
execute unless entity @s[tag=de_ag_wall_platform_keep] if score @s de_ag_wall_life matches 1.. run scoreboard players remove @s de_ag_wall_life 1
execute if score @s de_ag_wall_life matches 1.. run return 0
function zbk_der_eisendrache:anti_gravity/wall_run/platform/remove
