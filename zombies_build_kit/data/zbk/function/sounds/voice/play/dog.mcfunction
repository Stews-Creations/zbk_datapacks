function zbk:dispatch/sound_voice_dog
execute if data storage zbk:events result{blocked:1b} run return 0
execute if score @s character matches 1 run playsound zbk:voice.dog.character_1 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 2 run playsound zbk:voice.dog.character_2 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 3 run playsound zbk:voice.dog.character_3 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 4 run playsound zbk:voice.dog.character_4 voice @s ~ ~ ~ 1000 1 1
