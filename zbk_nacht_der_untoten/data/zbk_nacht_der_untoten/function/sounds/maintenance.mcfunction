execute unless score #active zbk.nacht matches 1 run return 0
execute unless score #game_active zbk.nacht matches 1 run return 0
scoreboard players add #ambient_music_timer zbk.nacht 1
execute if score #ambient_music_timer zbk.nacht matches 270.. run function zbk_nacht_der_untoten:sounds/music/play_ambient
execute if score #ambient_music_timer zbk.nacht matches 270.. run scoreboard players set #ambient_music_timer zbk.nacht 0
