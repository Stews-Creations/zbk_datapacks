# Cosmetic previews are per player and never survive game reset, map cleanup or reload.
scoreboard players reset * de_hud_preview
scoreboard players reset * de_hud_stage
clear @a minecraft:paper[custom_data~{de_quest_ui:1b}]
function zbk_der_eisendrache:quest/hud/inventory/clear_dropped

execute as @a run function zbk_der_eisendrache:quest/hud/inventory/fuse/clear
clear @a *[custom_data~{de_board_ui:1b}]
scoreboard players reset * de_ui_clock
scoreboard players reset * de_ui_owner
data remove storage zombies:quest_inventory owners
