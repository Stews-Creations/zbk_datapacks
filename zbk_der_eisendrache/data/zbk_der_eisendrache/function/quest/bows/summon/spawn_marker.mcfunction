# Summon bow spawn point marker
# Run this at the location where you want the dragon bow to appear

execute unless score #active zbk.de matches 1 run return 0

summon marker ~ ~ ~ {Tags:["quest_dragon_bow_spawn"]}
tellraw @a [{"text":"[Bows] ","color":"gold"},{"text":"Bow spawn point placed","color":"green"}]
