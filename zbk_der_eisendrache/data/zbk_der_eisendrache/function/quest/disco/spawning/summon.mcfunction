# Place a persistent Der Eisendrache disco marker and build its runtime.
execute unless score #active zbk.de matches 1 run return 0

summon marker ~ ~ ~ {Tags:["de_disco_marker"]}
execute at @e[type=marker,tag=de_disco_marker,distance=..1,limit=1,sort=nearest] run function zbk_der_eisendrache:quest/disco/spawning/spawn
