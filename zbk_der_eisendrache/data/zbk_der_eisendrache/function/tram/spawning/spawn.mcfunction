# Create one idle tram at every configured route start marker.
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=marker,tag=tram_start,scores={tram_link_id=1..}] at @s run function zbk_der_eisendrache:tram/route/summon
