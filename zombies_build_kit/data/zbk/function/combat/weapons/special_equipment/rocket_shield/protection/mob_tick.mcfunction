# Called from the existing piglin/wolf loop. Only reroute attacks aimed at shield owners.
scoreboard players set #rs_target temp 0
execute on target if entity @s[type=player,gamemode=!spectator,team=!downed,scores={rs_owned=1}] if items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run scoreboard players set #rs_target temp 1
execute if score #rs_target temp matches 0 run return run function zbk:combat/weapons/special_equipment/rocket_shield/protection/restore_mob
execute unless entity @s[tag=rs_melee_managed] run function zbk:combat/weapons/special_equipment/rocket_shield/protection/manage_mob
execute if score @s rs_attack_cd matches 1.. run scoreboard players remove @s rs_attack_cd 1
execute if score @s rs_attack_cd matches 1.. run return 0
tag @s add rs_attack_source
execute on target if entity @s[distance=..1.7] run function zbk:combat/weapons/special_equipment/rocket_shield/protection/contact
tag @s remove rs_attack_source
