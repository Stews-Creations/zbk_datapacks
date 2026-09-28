scoreboard objectives add zbk.nacht dummy
scoreboard objectives add give_nacht_radio trigger
scoreboard players set #active zbk.nacht 0
execute unless score #game_active zbk.nacht matches -2147483648..2147483647 run scoreboard players set #game_active zbk.nacht 0
execute unless score #ambient_music_timer zbk.nacht matches -2147483648..2147483647 run scoreboard players set #ambient_music_timer zbk.nacht 0
