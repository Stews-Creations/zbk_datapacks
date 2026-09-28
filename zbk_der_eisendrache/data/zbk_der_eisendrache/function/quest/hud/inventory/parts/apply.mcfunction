$execute store result score #de_part_count temp run clear @s minecraft:paper[custom_data~{de_board_ui:1b,part:$(key)}] 0
$execute if score #de_part_count temp matches 1 if items entity @s inventory.$(slot) minecraft:paper[custom_data~{de_board_ui:1b,part:$(key)}] run return 1
$execute store result score #de_hud_moved temp run function zbk_der_eisendrache:quest/hud/inventory/board/prepare_slot {slot:$(slot)}
execute unless score #de_hud_moved temp matches 1 run return 0
$clear @s minecraft:paper[custom_data~{de_board_ui:1b,part:$(key)}]
$item replace entity @s inventory.$(slot) with minecraft:paper[item_model="zbk_der_eisendrache:quest/hud/$(model)",custom_data={de_board_ui:1b,part:$(key)},max_stack_size=1,item_name={text:"$(name)",color:"gray"},lore=[{text:"Part tracking is not connected yet",color:"dark_gray",italic:false}]]
