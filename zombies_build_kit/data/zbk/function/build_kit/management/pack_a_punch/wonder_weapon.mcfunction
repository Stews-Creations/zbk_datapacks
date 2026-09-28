# Handles wonder weapons for the admin Pack-a-Punch element shortcut.
# Ray Gun can only be PaP I and never receives an element.

execute if score @s active_weapon matches 0 if score @s gun_1 matches 7 unless score @s tier_1 matches 1 run scoreboard players set @s tier_1 1
execute if score @s active_weapon matches 0 if score @s gun_1 matches 7 run scoreboard players set @s element_1 0

execute if score @s active_weapon matches 1 if score @s gun_2 matches 7 unless score @s tier_2 matches 1 run scoreboard players set @s tier_2 1
execute if score @s active_weapon matches 1 if score @s gun_2 matches 7 run scoreboard players set @s element_2 0

execute if score @s active_weapon matches 2 if score @s gun_3 matches 7 unless score @s tier_3 matches 1 run scoreboard players set @s tier_3 1
execute if score @s active_weapon matches 2 if score @s gun_3 matches 7 run scoreboard players set @s element_3 0

tellraw @s [{"text":"[Pack-a-Punch] ","color":"light_purple"},{"text":"Ray Gun cannot receive elemental effects","color":"red"}]
function zbk:player/inventory/weapons
return 0
