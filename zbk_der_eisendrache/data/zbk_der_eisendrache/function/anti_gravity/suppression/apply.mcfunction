# Keep room membership but prevent anti-gravity movement inside the 115 launch zone.
execute unless entity @s[tag=de_ag_inside] run return 0
execute if entity @s[tag=de_ag_suppressed] run return 0

tag @s add de_ag_suppressed
execute if entity @s[tag=de_ag_effects] run function zbk_der_eisendrache:anti_gravity/movement/remove
execute if entity @s[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Movement suppressed by 115 launch zone.","color":"yellow"}]
