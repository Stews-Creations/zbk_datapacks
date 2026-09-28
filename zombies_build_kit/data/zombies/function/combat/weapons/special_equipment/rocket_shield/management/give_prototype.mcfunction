# Temporary operator entry point. Keep existing slot contents if no free inventory slot exists.
execute unless items entity @s hotbar.5 *[custom_data~{rocket_shield_prototype:true}] if items entity @s hotbar.5 * run function zombies:player/inventory/equipment/preserve {source:"hotbar.5"}
execute unless items entity @s hotbar.5 *[custom_data~{rocket_shield_prototype:true}] if items entity @s hotbar.5 * run return 0
scoreboard players set @s rs_owned 1
scoreboard players set @s rs_durability 15
scoreboard players set @s rs_charges 3
scoreboard players set @s rs_boost_ticks 0
scoreboard players set @s rs_use_hold 0
scoreboard players set @s rs_use_lock 0
item replace entity @s hotbar.5 with minecraft:shield[max_damage=15,damage=0,blocks_attacks={damage_reductions:[],item_damage:{threshold:0,base:0,factor:0}},item_model="zombies:rocket_shield/shield_3",custom_name={text:"Rocket Shield",color:"gold",italic:false},custom_data={rocket_shield_prototype:true},attribute_modifiers=[{id:"rocket_shield_melee",type:"minecraft:attack_damage",amount:8,operation:"add_value",slot:"mainhand"}]] 1
