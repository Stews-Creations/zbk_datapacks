execute unless score #active zbk.nacht matches 1 run return 0
# Headshot callout: 55% chance, 30 tick cooldown
execute if score @s character matches 1 if score #voice_1 zbk.nacht matches 1.. run return fail
execute if score @s character matches 2 if score #voice_2 zbk.nacht matches 1.. run return fail
execute if score @s character matches 3 if score #voice_3 zbk.nacht matches 1.. run return fail
execute if score @s character matches 4 if score #voice_4 zbk.nacht matches 1.. run return fail
execute store result score #voice_rand zbk.nacht run random value 1..100
execute if score #voice_rand zbk.nacht matches ..55 run function #zbk:event/sound_voice_headshot
execute if score #voice_rand zbk.nacht matches ..55 if score @s character matches 1 run scoreboard players set #voice_1 zbk.nacht 400
execute if score #voice_rand zbk.nacht matches ..55 if score @s character matches 2 run scoreboard players set #voice_2 zbk.nacht 400
execute if score #voice_rand zbk.nacht matches ..55 if score @s character matches 3 run scoreboard players set #voice_3 zbk.nacht 400
execute if score #voice_rand zbk.nacht matches ..55 if score @s character matches 4 run scoreboard players set #voice_4 zbk.nacht 400
