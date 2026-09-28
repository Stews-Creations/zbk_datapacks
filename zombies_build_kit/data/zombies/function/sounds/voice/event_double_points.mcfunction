# double_points callout: 80% chance, shared 20-second cooldown
execute if score @s character matches 1 if score #voice_1 zbk.voice matches 1.. run return fail
execute if score @s character matches 2 if score #voice_2 zbk.voice matches 1.. run return fail
execute if score @s character matches 3 if score #voice_3 zbk.voice matches 1.. run return fail
execute if score @s character matches 4 if score #voice_4 zbk.voice matches 1.. run return fail
execute store result score #voice_rand zbk.voice run random value 1..100
execute if score #voice_rand zbk.voice matches ..80 run function zombies:sounds/voice/play/double_points
execute if score #voice_rand zbk.voice matches ..80 if score @s character matches 1 run scoreboard players set #voice_1 zbk.voice 400
execute if score #voice_rand zbk.voice matches ..80 if score @s character matches 2 run scoreboard players set #voice_2 zbk.voice 400
execute if score #voice_rand zbk.voice matches ..80 if score @s character matches 3 run scoreboard players set #voice_3 zbk.voice 400
execute if score #voice_rand zbk.voice matches ..80 if score @s character matches 4 run scoreboard players set #voice_4 zbk.voice 400
