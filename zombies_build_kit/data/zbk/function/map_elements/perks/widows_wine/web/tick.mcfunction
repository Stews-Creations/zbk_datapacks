execute if data entity @s {Health:0.0f} run function zbk:combat/enemies/lifecycle/native_death
execute if data entity @s {Health:0.0f} run return run function zbk:map_elements/perks/widows_wine/web/clear
execute if entity @s[tag=turned_zombie] run return run function zbk:map_elements/perks/widows_wine/web/clear
execute if score @s ww_strength matches 100 run data modify entity @s Motion set value [0.0d,0.0d,0.0d]
scoreboard players remove @s ww_timer 1
execute if score @s ww_timer matches ..0 run function zbk:map_elements/perks/widows_wine/web/clear
