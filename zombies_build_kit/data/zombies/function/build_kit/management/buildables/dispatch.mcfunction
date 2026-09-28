# Context: requesting player at their position. Equipment runtime belongs to Combat.
execute if score @s buildables_action matches 1 run function zombies:build_kit/management/buildables/give_bench_egg
execute if score @s buildables_action matches 2 run function zombies:build_kit/management/buildables/give_plate_egg
execute if score @s buildables_action matches 3 run function zombies:build_kit/management/buildables/give_mechanism_egg
execute if score @s buildables_action matches 4 run function zombies:build_kit/management/buildables/give_rocket_egg
execute if score @s buildables_action matches 5 run function zombies:combat/weapons/special_equipment/rocket_shield/management/give_prototype
execute if score @s buildables_action matches 6 run function zombies:combat/weapons/special_equipment/rocket_shield/management/refill
execute if score @s buildables_action matches 7 run function zombies:combat/weapons/special_equipment/rocket_shield/management/remove
execute if score @s buildables_action matches 8 run function zombies:map_elements/rocket_shield/management/give_all_parts
scoreboard players set @s buildables_action 0
scoreboard players enable @s buildables_action
