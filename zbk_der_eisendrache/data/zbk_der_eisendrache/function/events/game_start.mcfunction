execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:rocket/management/ensure_ready
scoreboard players operation #map_ready global = #rocket_ready global
function zbk_der_eisendrache:character/assign
scoreboard players set #voice_1 zbk.de 0
scoreboard players set #voice_2 zbk.de 0
scoreboard players set #voice_3 zbk.de 0
scoreboard players set #voice_4 zbk.de 0
schedule function zbk_der_eisendrache:rocket/management/start_game 60t replace
function zbk_der_eisendrache:tram/easter_egg/management/reset
