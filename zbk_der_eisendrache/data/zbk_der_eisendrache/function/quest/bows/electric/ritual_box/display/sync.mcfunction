# Context: persistent ritual marker at its position and rotation.
# Rebuild only the presentation required by the current phase; the active latch supports transition cleanup.

execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 4 run return 0
scoreboard players set #active de_eb_state 1
execute if score #phase de_eb_state matches 1..2 unless entity @e[type=item_display,tag=de_eb_arrow] run function zbk_der_eisendrache:quest/bows/electric/ritual_box/spawning/arrow
execute if score #phase de_eb_state matches 4 unless entity @e[type=item_display,tag=de_eb_bow] run function zbk_der_eisendrache:quest/bows/electric/ritual_box/spawning/bow
execute if score #phase de_eb_state matches 0 unless entity @e[type=interaction,tag=de_eb_interaction] run function zbk_der_eisendrache:quest/bows/electric/ritual_box/spawning/interaction {label:"place arrow"}
execute if score #phase de_eb_state matches 2 unless entity @e[type=interaction,tag=de_eb_interaction] run function zbk_der_eisendrache:quest/bows/electric/ritual_box/spawning/interaction {label:"offer bow"}
execute if score #phase de_eb_state matches 4 unless entity @e[type=interaction,tag=de_eb_interaction] run function zbk_der_eisendrache:quest/bows/electric/ritual_box/spawning/interaction {label:"pick up electric bow"}
