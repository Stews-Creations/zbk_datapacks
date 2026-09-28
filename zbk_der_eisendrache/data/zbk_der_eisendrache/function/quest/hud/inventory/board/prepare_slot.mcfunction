$execute unless items entity @s inventory.$(slot) * run return 1
$execute if items entity @s inventory.$(slot) *[custom_data~{de_board_ui:1b}] run return 1
$execute if items entity @s inventory.$(slot) *[custom_data~{de_quest_ui:1b}] run return 1
$return run function zbk_der_eisendrache:quest/hud/inventory/displace {slot:$(slot)}
