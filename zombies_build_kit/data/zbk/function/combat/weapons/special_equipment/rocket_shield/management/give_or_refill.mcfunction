# Player Tools entry point: refill an owned slot-6 shield (durability and boosts), otherwise give one.
execute if score @s rs_owned matches 1 if items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return run function zbk:combat/weapons/special_equipment/rocket_shield/management/refill
function zbk:combat/weapons/special_equipment/rocket_shield/management/give_prototype
