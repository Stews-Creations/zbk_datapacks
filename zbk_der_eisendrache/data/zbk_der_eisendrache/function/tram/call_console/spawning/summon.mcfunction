# Place the single persistent Tram call-console marker.
# Usage: function zbk_der_eisendrache:tram/call_console/spawning/summon {facing:"north"}
execute unless score #active zbk.de matches 1 run tellraw @s [{"text":"[Tram Console] ","color":"gold"},{"text":"Select Der Eisendrache before placing a call console.","color":"red"}]
execute unless score #active zbk.de matches 1 run return 0

# Placing the console again moves its persistent configuration.
kill @e[type=minecraft:marker,tag=tram_call_console]
$summon minecraft:marker ~ ~ ~ {Tags:["tram_marker","tram_call_console","tram_call_console_$(facing)","tram_call_console_new"]}
tag @e[type=minecraft:marker,tag=tram_call_console_new,distance=..1,limit=1,sort=nearest] remove tram_call_console_new
function zbk_der_eisendrache:tram/call_console/initialize
tellraw @s [{"text":"[Tram Console] ","color":"gold"},{"text":"Call console placed. It currently calls Tram 2.","color":"green"}]
