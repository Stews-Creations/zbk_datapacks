$execute store result score #de_hud_count temp run clear @s minecraft:paper[custom_data~{de_quest_ui:1b,quest:$(quest)}] 0
$execute if score #de_hud_count temp matches 1 if items entity @s inventory.$(slot) minecraft:paper[custom_data~{de_quest_ui:1b,quest:$(quest),stage:$(stage),preview:$(preview),active:$(active)},item_model="zbk_der_eisendrache:quest/hud/bow"] run return 1
scoreboard players set #de_hud_moved temp 1
$execute if items entity @s inventory.$(slot) * unless items entity @s inventory.$(slot) *[custom_data~{de_quest_ui:1b}] unless items entity @s inventory.$(slot) *[custom_data~{de_board_ui:1b}] store result score #de_hud_moved temp run function zbk_der_eisendrache:quest/hud/inventory/displace {slot:$(slot)}
execute unless score #de_hud_moved temp matches 1 run return 0
$clear @s minecraft:paper[custom_data~{de_quest_ui:1b,quest:$(quest)}]
$item replace entity @s inventory.$(slot) with minecraft:paper[item_model="zbk_der_eisendrache:quest/hud/bow",custom_model_data={floats:[$(model)]},custom_data={de_quest_ui:1b,quest:$(quest),stage:$(stage),preview:$(preview),active:$(active)},max_stack_size=1,item_name={text:"$(name) Bow Quest",color:"$(color)"},lore=[{text:"$(status)",color:"gray",italic:false},{text:"$(progress)",color:"dark_gray",italic:false}]]
return 1
