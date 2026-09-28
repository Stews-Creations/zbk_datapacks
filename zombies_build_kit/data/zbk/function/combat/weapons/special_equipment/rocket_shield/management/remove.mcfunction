function zbk:combat/weapons/special_equipment/rocket_shield/initialize
clear @s minecraft:shield[custom_data~{rocket_shield_prototype:true}]
tellraw @s {text:"Rocket Shield removed.",color:"yellow"}
