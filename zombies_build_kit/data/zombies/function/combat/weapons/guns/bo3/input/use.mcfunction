advancement revoke @s only zombies:bo3_weapon
execute if entity @s[tag=death_machine_active] run return 0
execute if score @s hide_gun matches 1.. run return 0
execute unless items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{bo3:true}] run return 0
function zombies:combat/weapons/guns/bo3/input/sync
execute unless score @s bo3_hold matches 1.. run scoreboard players set @s bo3_press 1
scoreboard players set @s bo3_hold 2
function zombies:combat/weapons/guns/bo3/input/dispatch
scoreboard players set @s bo3_press 0
