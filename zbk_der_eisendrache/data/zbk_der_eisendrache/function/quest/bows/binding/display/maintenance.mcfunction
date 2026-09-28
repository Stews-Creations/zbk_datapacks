# Reconcile missing or newly loaded runtime without per-tick entity discovery.
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=marker,tag=de_bow_pickup] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/binding/display/sync with entity @s data
