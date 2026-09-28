# Tactical ownership/ammo are authoritative; moved stacks never add ammunition.
execute unless score @s special_equipment matches 1..2 run return run clear @s *[custom_data~{special_equipment:true}]
execute unless score @s special_equipment_ammo matches 1.. run return run clear @s *[custom_data~{special_equipment:true}]
execute store result score #tactical_count temp run clear @s *[custom_data~{special_equipment:true}] 0
scoreboard players operation #tactical_expected temp = @s special_equipment_ammo
execute if score @s special_equipment matches 1 if score #tactical_expected temp matches 4.. run scoreboard players set #tactical_expected temp 3
execute if score @s special_equipment matches 2 if score #tactical_expected temp matches 3.. run scoreboard players set #tactical_expected temp 2
execute store result storage zbk:temp tactical_owner.player_id int 1 run scoreboard players get @s id
function zbk:player/inventory/equipment/reconcile_tactical with storage zbk:temp tactical_owner
