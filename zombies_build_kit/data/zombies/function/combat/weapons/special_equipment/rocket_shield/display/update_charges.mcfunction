# Event-driven slot-6 icon update; preserve durability and all other components.
execute unless items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return 0
execute if score @s rs_charges matches 0 run item modify entity @s hotbar.5 zombies:rocket_shield_charges_0
execute if score @s rs_charges matches 1 run item modify entity @s hotbar.5 zombies:rocket_shield_charges_1
execute if score @s rs_charges matches 2 run item modify entity @s hotbar.5 zombies:rocket_shield_charges_2
execute if score @s rs_charges matches 3 run item modify entity @s hotbar.5 zombies:rocket_shield_charges_3
