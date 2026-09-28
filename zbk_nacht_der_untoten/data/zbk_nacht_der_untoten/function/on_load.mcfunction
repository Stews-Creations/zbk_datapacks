scoreboard objectives add zbk.nacht dummy
scoreboard objectives add give_nacht_radio trigger
scoreboard objectives add character dummy
scoreboard players set #active zbk.nacht 0
execute unless score #voice_1 zbk.nacht matches -2147483648..2147483647 run scoreboard players set #voice_1 zbk.nacht 0
execute unless score #voice_2 zbk.nacht matches -2147483648..2147483647 run scoreboard players set #voice_2 zbk.nacht 0
execute unless score #voice_3 zbk.nacht matches -2147483648..2147483647 run scoreboard players set #voice_3 zbk.nacht 0
execute unless score #voice_4 zbk.nacht matches -2147483648..2147483647 run scoreboard players set #voice_4 zbk.nacht 0
execute unless score #game_active zbk.nacht matches -2147483648..2147483647 run scoreboard players set #game_active zbk.nacht 0
execute unless score #ambient_music_timer zbk.nacht matches -2147483648..2147483647 run scoreboard players set #ambient_music_timer zbk.nacht 0
