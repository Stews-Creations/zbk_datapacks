execute unless entity @s[gamemode=!spectator,team=!downed] run return 0
execute unless score @s rs_owned matches 1 run return 0
execute unless items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return 0
execute if items entity @s weapon.mainhand minecraft:shield[custom_data~{rocket_shield_prototype:true}] run return 0
return 1
