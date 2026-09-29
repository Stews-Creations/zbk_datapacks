# Pack active weapon to PaP I (only if currently unpacked) -- free, ignores cost
execute if score @s active_weapon matches 0 if score @s gun_1 matches 1.. if score @s tier_1 matches 0 run scoreboard players set @s tier_1 1
execute if score @s active_weapon matches 1 if score @s gun_2 matches 1.. if score @s tier_2 matches 0 run scoreboard players set @s tier_2 1
execute if score @s active_weapon matches 2 if score @s gun_3 matches 1.. if score @s tier_3 matches 0 run scoreboard players set @s tier_3 1
function zbk:player/inventory/weapons
