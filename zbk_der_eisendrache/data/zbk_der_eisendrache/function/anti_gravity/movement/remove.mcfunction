# Remove only the modifier owned by this module.
execute unless entity @s[tag=de_ag_effects] run return 0

function zbk_der_eisendrache:anti_gravity/double_jump/reset
attribute @s minecraft:gravity modifier remove zombies:anti_gravity
attribute @s minecraft:jump_strength modifier remove zombies:anti_gravity_jump
attribute @s minecraft:movement_speed modifier remove zombies:anti_gravity_speed
execute if score @s perk_stamina matches 1.. run attribute @s minecraft:movement_speed base set 0.15
tag @s remove de_ag_effects
particle minecraft:dust{color:[0.6,0.6,0.7],scale:0.7} ~ ~0.1 ~ 0.2 0.05 0.2 0 5 normal @s
execute if entity @s[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Movement] ","color":"light_purple"},{"text":"Gravity removed.","color":"gray"}]
