# Admin shortcut - bypasses the buy flow (no animation, no cost, no cooldown).
# Auto-pack the active weapon to PaP II and assign the macro-supplied element (1..5).
# Caller passes {element: 1..5} via function macro args.

# Wonder weapons use their own Pack-a-Punch policy.
execute if score @s active_weapon matches 0 if score @s gun_1 matches 7 run return run function zbk:build_kit/management/pack_a_punch/wonder_weapon
execute if score @s active_weapon matches 1 if score @s gun_2 matches 7 run return run function zbk:build_kit/management/pack_a_punch/wonder_weapon
execute if score @s active_weapon matches 2 if score @s gun_3 matches 7 run return run function zbk:build_kit/management/pack_a_punch/wonder_weapon

execute if score @s active_weapon matches 0 if score @s gun_1 matches 1.. run scoreboard players set @s tier_1 2
$execute if score @s active_weapon matches 0 if score @s gun_1 matches 1.. run scoreboard players set @s element_1 $(element)
execute if score @s active_weapon matches 1 if score @s gun_2 matches 1.. run scoreboard players set @s tier_2 2
$execute if score @s active_weapon matches 1 if score @s gun_2 matches 1.. run scoreboard players set @s element_2 $(element)
execute if score @s active_weapon matches 2 if score @s gun_3 matches 1.. run scoreboard players set @s tier_3 2
$execute if score @s active_weapon matches 2 if score @s gun_3 matches 1.. run scoreboard players set @s element_3 $(element)
function zbk:player/inventory/weapons
