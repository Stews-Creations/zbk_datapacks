# Context: orb facing the selected box. Test arrival before moving; refresh position for post-move particles.

execute if entity @e[type=marker,tag=de_eb_marker,distance=..0.4] run return run kill @s
tp @s ^ ^ ^0.3
execute at @s run function zbk_der_eisendrache:quest/bows/electric/soul_pots/effects/orb
