execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=marker,tag=de_bow_pickup] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/binding/display/tick with entity @s data
execute as @e[type=interaction,tag=de_bow_interaction] at @s if data entity @s interaction.player run function zbk_der_eisendrache:quest/bows/binding/interactions/interact
