execute unless score #active zbk.nacht matches 1 run return 0
# ===================================
# DR MONTY RADIO - SPAWN
# ===================================
# Purpose: Detect placed bat spawn egg, summon the prop, kill the bat

execute as @e[type=minecraft:bat,name="Dr Monty Radio"] at @s run function zbk_nacht_der_untoten:radio/spawning/place
kill @e[type=minecraft:bat,name="Dr Monty Radio"]
