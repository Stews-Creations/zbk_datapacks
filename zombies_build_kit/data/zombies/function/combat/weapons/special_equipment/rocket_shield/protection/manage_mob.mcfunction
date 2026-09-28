# Capture effective damage before suppression, preserving base stats and equipment.
execute store result score @s rs_native_damage run attribute @s minecraft:attack_damage get 1000
attribute @s minecraft:attack_damage modifier add zombies:shield_melee_router -1 add_multiplied_total
tag @s add rs_melee_managed
scoreboard players set @s rs_attack_cd 0
