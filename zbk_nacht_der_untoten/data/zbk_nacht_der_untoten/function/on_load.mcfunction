scoreboard objectives add zbk.nacht dummy
function zbk_nacht_der_untoten:dr_monty_radio/on_load
scoreboard players set #active zbk.nacht 0
execute unless score #game_active zbk.nacht matches -2147483648..2147483647 run scoreboard players set #game_active zbk.nacht 0
execute unless score #ambient_music_timer zbk.nacht matches -2147483648..2147483647 run scoreboard players set #ambient_music_timer zbk.nacht 0
