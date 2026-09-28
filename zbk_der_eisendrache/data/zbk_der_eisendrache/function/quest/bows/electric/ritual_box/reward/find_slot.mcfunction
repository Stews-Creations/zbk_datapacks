scoreboard players set #target de_eb_slot 0
execute if score @s de_eb_slot matches 1 if score @s gun_1 matches 0 run scoreboard players set #target de_eb_slot 1
execute if score @s de_eb_slot matches 2 if score @s gun_2 matches 0 run scoreboard players set #target de_eb_slot 2
execute if score @s de_eb_slot matches 3 if score @s gun_3 matches 0 if score @s perk_mule matches 1.. run scoreboard players set #target de_eb_slot 3
execute if score #target de_eb_slot matches 0 if score @s gun_1 matches 0 run scoreboard players set #target de_eb_slot 1
execute if score #target de_eb_slot matches 0 if score @s gun_2 matches 0 run scoreboard players set #target de_eb_slot 2
execute if score #target de_eb_slot matches 0 if score @s gun_3 matches 0 if score @s perk_mule matches 1.. run scoreboard players set #target de_eb_slot 3
