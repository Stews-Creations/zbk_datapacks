# Called after player, exact bench, and range validation. This bench stays reserved.
execute if entity @s[tag=cb_building] run function zombies:map_elements/crafting_bench/build/cancel
execute if score @s rs_owned matches 1 at @s rotated as @s run return run function zombies:combat/weapons/mechanics/input/interaction_use
execute if items entity @s inventory.* *[custom_data~{rocket_shield_prototype:true}] at @s rotated as @s run return run function zombies:combat/weapons/mechanics/input/interaction_use
execute if items entity @s hotbar.* *[custom_data~{rocket_shield_prototype:true}] at @s rotated as @s run return run function zombies:combat/weapons/mechanics/input/interaction_use
execute if items entity @s weapon.offhand *[custom_data~{rocket_shield_prototype:true}] at @s rotated as @s run return run function zombies:combat/weapons/mechanics/input/interaction_use
function zombies:combat/weapons/special_equipment/rocket_shield/management/give_prototype
