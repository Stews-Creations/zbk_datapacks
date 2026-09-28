function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/clear_runtime
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=marker,tag=de_eb_marker] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/ritual_box/display/sync
