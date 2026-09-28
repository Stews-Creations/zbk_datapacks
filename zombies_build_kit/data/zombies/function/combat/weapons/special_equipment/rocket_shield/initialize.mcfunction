scoreboard players set @s rs_durability 0
scoreboard players set @s rs_boost_ticks 0
scoreboard players set @s rs_charges 0
scoreboard players set @s rs_owned 0
scoreboard players set @s rs_use_hold 0
scoreboard players set @s rs_use_lock 0
function zombies:combat/weapons/special_equipment/rocket_shield/display/clear
advancement revoke @s only zombies:rocket_shield_use
advancement revoke @s only zombies:rocket_shield_melee
execute if items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run item replace entity @s hotbar.5 with minecraft:air
