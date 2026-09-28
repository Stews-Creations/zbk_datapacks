# Before display reconciliation: a legal Q/Control-Q drop reduces the canonical stack.
scoreboard players set #tactical_remaining temp 0
execute if items entity @s hotbar.4 *[custom_data~{special_equipment:true,monkey_bomb:true}] store result score #tactical_remaining temp run data get entity @s Inventory[{Slot:4b}].count
scoreboard players operation #tactical_before temp = @s special_equipment_ammo
execute if score #tactical_before temp matches 4.. run scoreboard players set #tactical_before temp 3
execute if score #tactical_remaining temp >= #tactical_before temp run return 0
execute store result storage zbk:temp tactical_drop.player_id int 1 run scoreboard players get @s id
data modify storage zbk:temp tactical_drop.uuid set from entity @s UUID
function zbk:combat/weapons/special_equipment/detection/select_monkey_drop with storage zbk:temp tactical_drop
data remove storage zbk:temp tactical_drop
