execute unless score #active zbk.de matches 1 run return 0
execute unless score #global game_active matches 1 run return 0
scoreboard players add #ambient_music_timer zbk.de 1
execute if score #ambient_music_timer zbk.de matches 270.. run function zbk_der_eisendrache:game/audio/music/play_ambient
execute if score #ambient_music_timer zbk.de matches 270.. run scoreboard players set #ambient_music_timer zbk.de 0
