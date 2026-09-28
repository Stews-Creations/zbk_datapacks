# Context: persistent reforging marker at its position and rotation.
# The active latch records live presentation; stage guards must precede reconstruction.

execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 3 run return 0
scoreboard players set #active de_er_state 1
execute if score #sequence de_er_state matches 3 run return 0
execute unless entity @e[type=item_display,tag=de_er_arrow] run function zbk_der_eisendrache:quest/bows/electric/reforging/spawning/arrow
execute if score #sequence de_er_state matches 0 unless entity @e[type=interaction,tag=de_er_interaction] run function zbk_der_eisendrache:quest/bows/electric/reforging/spawning/interaction
execute if score #sequence de_er_state matches 2 unless entity @e[type=interaction,tag=de_er_interaction] run function zbk_der_eisendrache:quest/bows/electric/reforging/spawning/interaction
execute if score #sequence de_er_state matches 2 unless entity @e[type=text_display,tag=de_er_label] run function zbk_der_eisendrache:quest/bows/electric/reforging/spawning/label
