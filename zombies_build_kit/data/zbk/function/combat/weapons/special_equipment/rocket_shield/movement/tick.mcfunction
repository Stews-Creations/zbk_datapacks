execute unless entity @s[gamemode=!spectator,team=!downed] run scoreboard players set @s rs_boost_ticks 0
execute if score @s rs_boost_ticks matches ..0 run return 0
execute unless score @s rs_owned matches 1 run scoreboard players set @s rs_boost_ticks 0
execute if score @s rs_boost_ticks matches ..0 run return 0
execute unless items entity @s hotbar.5 minecraft:shield[custom_data~{rocket_shield_prototype:true}] run scoreboard players set @s rs_boost_ticks 0
execute if score @s rs_boost_ticks matches ..0 run return 0
execute store result score @s rs_selected run data get entity @s SelectedItemSlot
execute unless score @s rs_selected matches 5 run scoreboard players set @s rs_boost_ticks 0
execute if score @s rs_boost_ticks matches ..0 run return 0
execute at @s run function zbk:combat/weapons/special_equipment/rocket_shield/damage/sweep
# Two short collision-checked steps give 0.6 blocks per tick without skipping walls.
execute at @s run function zbk:combat/weapons/special_equipment/rocket_shield/movement/step
execute if score @s rs_step_moved matches 1 at @s run function zbk:combat/weapons/special_equipment/rocket_shield/damage/sweep
execute if score @s rs_step_moved matches 0 run return run scoreboard players set @s rs_boost_ticks 0
execute at @s rotated as @s rotated ~ 0 run function zbk:combat/weapons/special_equipment/rocket_shield/effects/bash_trail
execute at @s run function zbk:combat/weapons/special_equipment/rocket_shield/movement/step
execute if score @s rs_step_moved matches 1 at @s run function zbk:combat/weapons/special_equipment/rocket_shield/damage/sweep
execute if score @s rs_step_moved matches 0 run scoreboard players set @s rs_boost_ticks 0
execute if score @s rs_boost_ticks matches 1.. run scoreboard players remove @s rs_boost_ticks 1
