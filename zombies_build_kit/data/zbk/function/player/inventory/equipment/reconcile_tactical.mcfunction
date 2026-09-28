# Read both total inventory count and canonical-slot count before deciding it is already valid.
scoreboard players set #tactical_slot_count temp 0
execute store result score #tactical_slot_count temp run data get entity @s Inventory[{Slot:4b}].count
$execute if score #tactical_count temp = #tactical_expected temp if score #tactical_slot_count temp = #tactical_expected temp if score @s special_equipment matches 1 if items entity @s hotbar.4 minecraft:slime_ball[custom_data~{player_id:$(player_id),special_equipment:true,special_equipment_id:1,monkey_bomb:true}] run return 1
$execute if score #tactical_count temp = #tactical_expected temp if score #tactical_slot_count temp = #tactical_expected temp if score @s special_equipment matches 2 if items entity @s hotbar.4 minecraft:slime_ball[custom_data~{player_id:$(player_id),special_equipment:true,special_equipment_id:2,trip_mine:true},consumable] run return 1
clear @s *[custom_data~{special_equipment:true}]
execute store result score #equipment_reserved temp run function zbk:player/inventory/equipment/reserve {slot:"hotbar.4"}
execute unless score #equipment_reserved temp matches 1 run return 0
$function zbk:player/inventory/equipment/render_tactical {player_id:$(player_id)}
