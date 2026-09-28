# Context: one orb at its position. Lifetime and stage checks precede target selection.
# If the target is absent, remove the orb instead of reusing an old destination.

scoreboard players add @s de_eb_time 1
execute if score @s de_eb_time matches 100.. run return run kill @s
execute unless score #phase de_eb_state matches 1..2 run return run kill @s
execute facing entity @e[type=marker,tag=de_eb_marker,limit=1] feet run return run function zbk_der_eisendrache:quest/bows/electric/ritual_box/animations/advance_orb
kill @s
