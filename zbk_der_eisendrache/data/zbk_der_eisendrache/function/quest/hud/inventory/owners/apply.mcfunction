$execute store result score #de_head_count temp run clear @s *[custom_data~{de_board_ui:1b,portrait:$(quest)}] 0
$execute if score #de_head_count temp matches 1 if items entity @s inventory.$(slot) *[custom_data~{de_board_ui:1b,portrait:$(quest),owner:$(owner),available:$(available)},custom_name] run return 1
$execute store result score #de_hud_moved temp run function zbk_der_eisendrache:quest/hud/inventory/board/prepare_slot {slot:$(slot)}
execute unless score #de_hud_moved temp matches 1 run return 0
$clear @s *[custom_data~{de_board_ui:1b,portrait:$(quest)}]
execute if data storage zombies:quest_inventory head.profile run return run function zbk_der_eisendrache:quest/hud/inventory/owners/place_head with storage zombies:quest_inventory head
$item replace entity @s inventory.$(slot) with minecraft:paper[item_model="zbk_der_eisendrache:quest/hud/owner_empty",custom_data={de_board_ui:1b,portrait:$(quest),owner:$(owner),available:$(available)},max_stack_size=1,item_name={text:"$(status)",color:"gray"}]
