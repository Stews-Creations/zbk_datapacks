function zbk:map_elements/mystery_box/events/sound_voice_box_gun
execute if data storage zbk:events result{blocked:1b} run return 0
execute if score @s character matches 1 run playsound zbk:voice.box_gun.character_1 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 2 run playsound zbk:voice.box_gun.character_2 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 3 run playsound zbk:voice.box_gun.character_3 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 4 run playsound zbk:voice.box_gun.character_4 voice @s ~ ~ ~ 1000 1 1
