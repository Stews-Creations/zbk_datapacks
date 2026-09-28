# Recover a weapon-use pulse swallowed by an out-of-range pickup interaction.
# Caller is the actual clicking player, positioned and rotated at that player.
execute if entity @s[gamemode=spectator] run return 0
execute if score @s hide_gun matches 1.. run return 0
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return 0
execute if items entity @s weapon.mainhand *[custom_data~{rocket_shield_prototype:true}] run return 0
execute if items entity @s weapon.offhand *[custom_data~{death_machine:true}] run return run function zbk:combat/powerups/death_machine/on_use
execute if items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{bo3:true}] run return run function zbk:combat/weapons/guns/bo3/input/use
execute if items entity @s weapon.offhand *[custom_data~{gun_id:7}] run return run function zbk:combat/weapons/guns/ray_gun/fire
function zbk:dispatch/extension/combat/weapons/mechanics/input/interaction_use/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
