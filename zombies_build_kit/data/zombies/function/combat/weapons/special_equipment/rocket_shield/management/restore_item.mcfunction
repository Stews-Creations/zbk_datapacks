# Ownership, durability and fuel survive moving or dropping the cosmetic item.
clear @s minecraft:shield[custom_data~{rocket_shield_prototype:true}]
execute if items entity @s hotbar.5 * run function zombies:player/inventory/equipment/preserve {source:"hotbar.5"}
execute if items entity @s hotbar.5 * run return 0
item replace entity @s hotbar.5 with minecraft:shield[max_damage=15,damage=0,blocks_attacks={damage_reductions:[],item_damage:{threshold:0,base:0,factor:0}},item_model="zombies:rocket_shield/shield_3",custom_name={text:"Rocket Shield",color:"gold",italic:false},custom_data={rocket_shield_prototype:true},attribute_modifiers=[{id:"rocket_shield_melee",type:"minecraft:attack_damage",amount:8,operation:"add_value",slot:"mainhand"}]] 1
function zombies:combat/weapons/special_equipment/rocket_shield/display/update_charges
function zombies:combat/weapons/special_equipment/rocket_shield/display/update_durability
