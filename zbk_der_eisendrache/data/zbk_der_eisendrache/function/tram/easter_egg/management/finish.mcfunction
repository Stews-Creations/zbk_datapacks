# Restore the normal lamps, unlock the console, and complete the replacement call.
execute unless score #active zbk.de matches 1 run return 0
function zbk_der_eisendrache:tram/easter_egg/display/restore
scoreboard players set #global tram_ee_timer 0
function zbk_der_eisendrache:tram/management/call {id:1}
execute at @e[type=minecraft:marker,tag=tram_call_console,limit=1] run playsound minecraft:block.beacon.activate player @a ~ ~ ~ 0.9 1.25
