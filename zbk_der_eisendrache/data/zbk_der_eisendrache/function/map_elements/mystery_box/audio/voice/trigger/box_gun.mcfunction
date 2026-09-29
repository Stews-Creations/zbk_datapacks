execute unless score #active zbk.de matches 1 run return 0
# Mystery box gun callout: 80% chance, 40 tick cooldown
execute if score @s character matches 1 if score #voice_1 zbk.de matches 1.. run return fail
execute if score @s character matches 2 if score #voice_2 zbk.de matches 1.. run return fail
execute if score @s character matches 3 if score #voice_3 zbk.de matches 1.. run return fail
execute if score @s character matches 4 if score #voice_4 zbk.de matches 1.. run return fail
execute store result score #voice_rand zbk.de run random value 1..100
execute if score #voice_rand zbk.de matches ..80 run function #zbk:event/sound/voice/box_gun
execute if score #voice_rand zbk.de matches ..80 if score @s character matches 1 run scoreboard players set #voice_1 zbk.de 400
execute if score #voice_rand zbk.de matches ..80 if score @s character matches 2 run scoreboard players set #voice_2 zbk.de 400
execute if score #voice_rand zbk.de matches ..80 if score @s character matches 3 run scoreboard players set #voice_3 zbk.de 400
execute if score #voice_rand zbk.de matches ..80 if score @s character matches 4 run scoreboard players set #voice_4 zbk.de 400
