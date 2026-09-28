# Display weapon based on gun_1 score
# 0 = no gun / empty slot
execute as @s[scores={gun_1=0}] run item replace entity @s weapon.offhand with minecraft:air







# 7 = ray_gun
execute as @s[scores={gun_1=7,tier_1=..0}] unless data entity @s Inventory[{Slot:-106b,id:"minecraft:ghast_tear",components:{custom_data:{gun_id:7}}}] run item replace entity @s weapon.offhand with minecraft:ghast_tear[item_model="zbk:ray_gun",custom_name={"text":"Ray Gun","color":"gold","italic":false},custom_data={gun:true,gun_id:7},consumable={consume_seconds:1000000},use_effects={can_sprint:true,speed_multiplier:1.0}]
execute as @s[scores={gun_1=7}] if score @s tier_1 matches 1.. unless data entity @s Inventory[{Slot:-106b,id:"minecraft:ghast_tear",components:{custom_data:{gun_id:7,pap:1}}}] run item replace entity @s weapon.offhand with minecraft:ghast_tear[item_model="zbk:ray_gun",custom_name={"text":"Porter's X2 Ray Gun","color":"light_purple","italic":false},custom_data={gun:true,gun_id:7,pap:1},consumable={consume_seconds:1000000},enchantment_glint_override=true,use_effects={can_sprint:true,speed_multiplier:1.0}]




function zbk:dispatch/extension/player/inventory/weapon_displays/gun_1/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:dispatch/extension/player/inventory/weapon_displays/gun_1/2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:dispatch/extension/player/inventory/weapon_displays/gun_1/3
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:dispatch/extension/player/inventory/weapon_displays/gun_1/4
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

function zbk:dispatch/extension/player/inventory/weapon_displays/gun_1/5
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute if score @s gun_1 matches 20..46 run function zombies:combat/weapons/guns/bo3/display/slot_1
