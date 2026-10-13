execute if entity @s[tag=monkey_bomb_decoy] run return 0
execute if entity @s[tag=solo_down_decoy] run return 0
execute if entity @s[tag=combat_ignore] run return 0
execute if entity @s[tag=immune_elements] run return 0
execute if entity @s[tag=turned_zombie] run return 0
execute if data entity @s {Health:0.0f} run return 0
execute unless entity @s[tag=ww_webbed] run scoreboard players set @s ww_strength 0
execute if score #ww_strength stats > @s ww_strength run scoreboard players operation @s ww_strength = #ww_strength stats
attribute @s minecraft:movement_speed modifier remove zbk:widows_web
execute if score @s ww_strength matches 100 run attribute @s minecraft:movement_speed modifier add zbk:widows_web -1 add_multiplied_total
execute if score @s ww_strength matches 75 run attribute @s minecraft:movement_speed modifier add zbk:widows_web -0.75 add_multiplied_total
execute if score @s ww_strength matches 40 run attribute @s minecraft:movement_speed modifier add zbk:widows_web -0.4 add_multiplied_total
execute unless entity @s[tag=ww_webbed] run function zbk:map_elements/perks/widows_wine/web/visual
tag @s add ww_webbed
scoreboard players set @s ww_timer 400
