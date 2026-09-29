# Reset weapon system (remove mule kick)
execute if score @s active_weapon matches 2 run scoreboard players set @s active_weapon 0
execute if score @s weapon_count matches 3 run scoreboard players set @s weapon_count 2
scoreboard players set @s gun_3 0
scoreboard players set @s tier_3 0
scoreboard players set @s element_3 0
