# Prototype movement only. Player setup and bleed-out call initialize.
execute if score @s rs_owned matches 1 unless items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run function zbk:combat/weapons/special_equipment/rocket_shield/management/restore_item
execute if score @s rs_use_hold matches 1.. run scoreboard players remove @s rs_use_hold 1
execute if score @s rs_use_hold matches ..0 run scoreboard players set @s rs_use_lock 0
execute if score @s rs_boost_ticks matches 1.. at @s run function zbk:combat/weapons/special_equipment/rocket_shield/movement/tick
function zbk:combat/weapons/special_equipment/rocket_shield/display/tick
