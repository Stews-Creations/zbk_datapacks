# Remove moved/cursor copies before reclaiming the canonical melee slot.
clear @s *[custom_data~{knife:true}]
execute if items entity @s hotbar.3 *[custom_data~{gun:true}] run item replace entity @s hotbar.3 with minecraft:air
execute store result score #equipment_reserved temp run function zbk:player/inventory/equipment/reserve {slot:"hotbar.3"}
execute unless score #equipment_reserved temp matches 1 run return 0
# Store player identity and atomically rebuild the slot-three Bowie Knife.
execute store result storage zbk:temp bowie_knife.player_id int 1 run scoreboard players get @s id
function zbk:player/inventory/give_bowie_knife with storage zbk:temp bowie_knife
