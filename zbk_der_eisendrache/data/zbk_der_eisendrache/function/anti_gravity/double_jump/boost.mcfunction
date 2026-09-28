# Consume the one air jump and apply a short upward impulse.
execute unless score #room de_ag_state matches 1 run return 0
execute unless entity @s[tag=de_ag_effects,tag=de_ag_air_jump_ready] run return 0
execute if entity @s[nbt={OnGround:1b}] run return 0

tag @s remove de_ag_air_jump_ready
scoreboard players set @s de_ag_jump_t 6
effect give @s minecraft:levitation 1 6 true
particle minecraft:dust{color:[0.55,0.3,1.0],scale:1.0} ~ ~0.15 ~ 0.35 0.08 0.35 0 14 normal @s
playsound minecraft:entity.breeze.jump player @s ~ ~ ~ 0.7 1.3
execute if entity @s[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Movement] ","color":"light_purple"},{"text":"Air jump used.","color":"aqua"}]
