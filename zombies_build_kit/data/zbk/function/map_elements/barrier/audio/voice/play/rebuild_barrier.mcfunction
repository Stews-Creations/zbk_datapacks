function zbk:map_elements/barrier/events/sound_voice_rebuild_barrier
execute if data storage zbk:events result{blocked:1b} run return 0
execute if score @s character matches 1 run playsound zbk:voice.rebuild_barrier.character_1 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 2 run playsound zbk:voice.rebuild_barrier.character_2 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 3 run playsound zbk:voice.rebuild_barrier.character_3 voice @s ~ ~ ~ 1000 1 1
execute if score @s character matches 4 run playsound zbk:voice.rebuild_barrier.character_4 voice @s ~ ~ ~ 1000 1 1
