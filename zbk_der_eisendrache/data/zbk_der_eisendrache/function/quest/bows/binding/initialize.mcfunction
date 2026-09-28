# Reset owners even when offline; individual quests own readiness/progress resets.
kill @e[tag=de_bow_runtime]
scoreboard players reset * de_bow_owner
scoreboard players reset * de_bow_started
execute if score #active zbk.de matches 1 as @e[type=marker,tag=de_bow_pickup] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/binding/display/sync with entity @s data
