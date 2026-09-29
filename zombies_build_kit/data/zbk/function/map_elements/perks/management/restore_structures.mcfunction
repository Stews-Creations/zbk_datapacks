# Convert transitional model placements once, preserving their saved orientation.
kill @e[tag=pm_runtime]
execute as @e[type=marker,tag=pm_marker] at @s run function zbk:map_elements/perks/management/restore_structure

