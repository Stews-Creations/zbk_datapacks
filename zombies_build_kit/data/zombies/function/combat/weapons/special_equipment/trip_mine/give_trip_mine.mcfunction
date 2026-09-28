# ===================================
# GIVE TRIP MINES
# ===================================
# Special equipment id 2 = Trip Mines.

scoreboard players set @s special_equipment 2
scoreboard players set @s max_special_equipment_ammo 2
scoreboard players set @s special_equipment_ammo 2

function zombies:player/inventory/special_equipment
tellraw @s [{"text":"[Special Equipment] ","color":"gold"},{"text":"Trip Mines equipped x2","color":"green"}]
