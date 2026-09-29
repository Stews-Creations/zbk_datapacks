execute unless score #global game_active matches 1 run return 0
execute if entity @s[gamemode=adventure] unless score @s character matches 1..4 run function zbk:player/voice/management/assign_step
function zbk:player/health/events/voice_try_take_damage
