# Existing helmets and the dog-round pumpkin take priority; never displace them.
execute if items entity @s armor.head * run return 0
clear @s minecraft:paper[custom_data~{rs_head_cosmetic:true}]
item replace entity @s armor.head with minecraft:paper[item_model="zbk:rocket_shield/stowed_head",custom_name={text:"Rocket Shield (Stowed)",color:"gold",italic:false},custom_data={rs_head_cosmetic:true},equippable={slot:"head",dispensable:false,swappable:false,damage_on_hurt:false}] 1
