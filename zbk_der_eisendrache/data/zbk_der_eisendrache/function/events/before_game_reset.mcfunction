function zbk_der_eisendrache:intro_cutscene/management/cancel_pending
execute unless score #active zbk.de matches 1 run return 0
scoreboard players set #rocket_skip_reset global 0
scoreboard players set #tram_skip_reset global 0
execute if data storage zbk:events stack[-1].context{reason:"new_game"} run function zbk_der_eisendrache:events/prepare_game_reset
