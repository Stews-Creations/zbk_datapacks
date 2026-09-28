# Temporary operator entry point. Select key 6 and call as the player at their position.
execute unless entity @s[gamemode=!spectator,team=!downed] run return 0
execute unless score @s rs_owned matches 1 run return 0
execute unless score @s rs_charges matches 1.. run return 0
execute if score @s rs_boost_ticks matches 1.. run return 0
execute unless items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return 0
execute store result score @s rs_selected run data get entity @s SelectedItemSlot
execute unless score @s rs_selected matches 5 run return 0
scoreboard players remove @s rs_charges 1
function zbk:combat/weapons/special_equipment/rocket_shield/display/update_charges
scoreboard players set @s rs_boost_ticks 12
