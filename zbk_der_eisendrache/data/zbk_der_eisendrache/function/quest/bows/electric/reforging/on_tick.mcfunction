# Deactivate immediately when leaving the stage; later unloaded presentation is reconciled once per second.
# Keep marker synchronization, interactions, and animation as ordered global phases.

execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 3 unless score #active de_er_state matches 0 run function zbk_der_eisendrache:quest/bows/electric/reforging/management/inactive
execute unless score #electric de_el_progress matches 3 run return 0
scoreboard players set #active de_er_state 1
scoreboard players operation @e[type=marker,tag=de_er_marker] de_er_state = #sequence de_er_state
execute if score #sequence de_er_state matches 0..1 as @e[type=item_display,tag=de_el_vane_head] at @s run function zbk_der_eisendrache:quest/bows/electric/reforging/effects/vane
execute as @e[type=marker,tag=de_er_marker] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/reforging/display/tick_marker

execute as @e[type=interaction,tag=de_er_interaction] at @s if data entity @s interaction.player run function zbk_der_eisendrache:quest/bows/electric/reforging/interactions/read
execute as @e[type=marker,tag=de_er_marker,scores={de_er_state=1}] at @s run function zbk_der_eisendrache:quest/bows/electric/reforging/animations/tick
