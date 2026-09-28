# Reduce gravity to 25% and increase movement and launch velocity.
execute unless score #room de_ag_state matches 1 run return 0
execute unless entity @s[tag=de_ag_inside,tag=!de_ag_suppressed,tag=!de_ag_effects] run return 0

attribute @s minecraft:gravity modifier add zombies:anti_gravity -0.75 add_multiplied_base
attribute @s minecraft:jump_strength modifier add zombies:anti_gravity_jump 0.2 add_multiplied_base
attribute @s minecraft:movement_speed modifier add zombies:anti_gravity_speed 0.6 add_multiplied_total
tag @s add de_ag_effects
particle minecraft:dust{color:[0.45,0.25,1.0],scale:0.8} ~ ~0.1 ~ 0.25 0.05 0.25 0 8 normal @s
execute if entity @s[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Movement] ","color":"light_purple"},{"text":"Gravity applied.","color":"green"}]
