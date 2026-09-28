# Release this player's binding only; never modify feature progress, wall state or readiness.
execute unless score #active zbk.de matches 1 run return 0
execute unless score @s id matches 1.. run return 0
execute if score #1 de_bow_owner = @s id run scoreboard players reset #1 de_bow_owner
execute if score #2 de_bow_owner = @s id run scoreboard players reset #2 de_bow_owner
execute if score #3 de_bow_owner = @s id run scoreboard players reset #3 de_bow_owner
execute if score #4 de_bow_owner = @s id run scoreboard players reset #4 de_bow_owner
execute as @e[type=marker,tag=de_bow_pickup] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/binding/display/sync with entity @s data
