# Reset all online and offline player progress for a new Der Eisendrache game.
execute unless score #active zbk.de matches 1 run return 0
scoreboard players reset * tram_ee_ready
scoreboard players reset * tram_ee_calls
scoreboard players reset * tram_ee_used
scoreboard players set #global tram_ee_timer 0
function zbk_der_eisendrache:tram/easter_egg/display/restore
