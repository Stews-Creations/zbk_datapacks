execute unless score #global game_active matches 1 run return 0
execute if entity @s[gamemode=adventure] unless score @s character matches 1..4 run function zbk:sounds/voice/assign_step
function zbk:dispatch/voice_try_take_damage
