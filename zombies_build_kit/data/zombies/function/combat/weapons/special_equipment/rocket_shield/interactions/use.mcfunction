advancement revoke @s only zombies:rocket_shield_use
execute unless items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return 0
scoreboard players set @s rs_use_hold 2
execute if score @s rs_use_lock matches 1.. run return 0
scoreboard players set @s rs_use_lock 1
function zombies:combat/weapons/special_equipment/rocket_shield/management/boost_prototype
