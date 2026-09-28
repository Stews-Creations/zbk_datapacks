# ===================================
# GIVE MONKEY BOMB
# ===================================
# COD Zombies gives three Monkey Bombs from the Mystery Box.
# Special equipment id 1 = Monkey Bomb.

scoreboard players set @s special_equipment 1
scoreboard players set @s max_special_equipment_ammo 3
scoreboard players set @s special_equipment_ammo 3

function zombies:player/inventory/special_equipment
tellraw @s [{"text":"[Special Equipment] ","color":"gold"},{"text":"Monkey Bombs equipped x3","color":"green"}]
