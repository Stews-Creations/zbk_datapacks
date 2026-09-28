# Advance the active full-console flicker and finish after 18 ticks (0.9 seconds).
execute unless score #active zbk.de matches 1 run return 0
execute unless score #global tram_ee_timer matches 1.. run return 0
execute unless score #global game_active matches 1.. run return run function zbk_der_eisendrache:tram/easter_egg/management/cancel

execute if score #global tram_ee_timer matches 1..3 run function zbk_der_eisendrache:tram/easter_egg/display/both_green
execute if score #global tram_ee_timer matches 4..6 run function zbk_der_eisendrache:tram/easter_egg/display/both_black
execute if score #global tram_ee_timer matches 7..9 run function zbk_der_eisendrache:tram/easter_egg/display/both_green
execute if score #global tram_ee_timer matches 10..12 run function zbk_der_eisendrache:tram/easter_egg/display/both_black
execute if score #global tram_ee_timer matches 13..15 run function zbk_der_eisendrache:tram/easter_egg/display/both_green
execute if score #global tram_ee_timer matches 16..18 run function zbk_der_eisendrache:tram/easter_egg/display/both_black
scoreboard players add #global tram_ee_timer 1
execute if score #global tram_ee_timer matches 19.. run function zbk_der_eisendrache:tram/easter_egg/management/finish
