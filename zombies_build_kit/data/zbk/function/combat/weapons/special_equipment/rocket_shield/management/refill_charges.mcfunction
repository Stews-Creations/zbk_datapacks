# Max Ammo restores fuel only, never repairs or grants a missing shield.
execute unless score @s rs_owned matches 1 run return 0
execute unless items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return 0
scoreboard players set @s rs_charges 3
function zbk:combat/weapons/special_equipment/rocket_shield/display/update_charges
