scoreboard players set #rs_damage temp 15
scoreboard players operation #rs_damage temp -= @s rs_durability
execute store result storage zbk:shield_attack damage int 1 run scoreboard players get #rs_damage temp
function zbk:combat/weapons/special_equipment/rocket_shield/display/durability_item with storage zbk:shield_attack
