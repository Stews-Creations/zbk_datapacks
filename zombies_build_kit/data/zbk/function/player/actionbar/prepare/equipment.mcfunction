# Numbered empty frames follow native hotbar selection; actual items remain visible.
execute store result score #hud_selected temp run data get entity @s SelectedItemSlot
data modify storage zbk:hud args.equipment_frame_1 set value "\uE0B0"
execute if score #hud_selected temp matches 3 run data modify storage zbk:hud args.equipment_frame_1 set value "\uE0B4"
data modify storage zbk:hud args.equipment_frame_2 set value "\uE0B1"
execute if score #hud_selected temp matches 4 run data modify storage zbk:hud args.equipment_frame_2 set value "\uE0B5"
data modify storage zbk:hud args.equipment_frame_3 set value "\uE0B2"
execute if score #hud_selected temp matches 5 run data modify storage zbk:hud args.equipment_frame_3 set value "\uE0B6"
data modify storage zbk:hud args.equipment_frame_4 set value "\uE0B3"
execute if score #hud_selected temp matches 6 run data modify storage zbk:hud args.equipment_frame_4 set value "\uE0B7"
