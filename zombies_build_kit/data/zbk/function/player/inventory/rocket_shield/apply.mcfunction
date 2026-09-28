$execute store result score #rs_ui_count temp run clear @s *[custom_data~{rs_part_ui:true,part:"$(part)"}] 0
$execute if score #rs_ui_count temp matches 1 if items entity @s inventory.$(slot) *[custom_data~{rs_part_ui:true,part:"$(part)",collected:$(collected)}] run return 1
$execute if items entity @s inventory.$(slot) * unless items entity @s inventory.$(slot) *[custom_data~{rs_part_ui:true}] store result score #rs_ui_moved temp run function zbk:player/inventory/rocket_shield/displace {slot:$(slot)}
$execute if items entity @s inventory.$(slot) * unless items entity @s inventory.$(slot) *[custom_data~{rs_part_ui:true}] run return 0
$clear @s *[custom_data~{rs_part_ui:true,part:"$(part)"}]
$item replace entity @s inventory.$(slot) with minecraft:paper[item_model="$(model)",custom_data={rs_part_ui:true,part:"$(part)",collected:$(collected)},max_stack_size=1,item_name={text:"Rocket Shield - $(part)",color:"$(color)"},lore=[{text:"$(status)",color:"$(color)",italic:false}]]
