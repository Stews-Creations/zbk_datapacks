# Clear a departing stage immediately; the maintenance hook catches runtime from later-loaded chunks.
# Display reconstruction precedes interactions, which precede animation and orb movement.

execute unless score #active zbk.de matches 1 run return 0
execute unless score #electric de_el_progress matches 4 unless score #active de_eb_state matches 0 run function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/clear_runtime
execute unless score #electric de_el_progress matches 4 run return 0
scoreboard players set #active de_eb_state 1
execute as @e[tag=de_eb_content] unless score @s de_eb_state = #phase de_eb_state run kill @s
execute as @e[type=marker,tag=de_eb_marker] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/ritual_box/display/sync
execute as @e[type=interaction,tag=de_eb_interaction] at @s if data entity @s interaction.player run function zbk_der_eisendrache:quest/bows/electric/ritual_box/interactions/read
execute as @e[type=marker,tag=de_eb_marker] at @s run function zbk_der_eisendrache:quest/bows/electric/ritual_box/animations/tick
execute as @e[type=marker,tag=de_eb_orb] at @s run function zbk_der_eisendrache:quest/bows/electric/ritual_box/animations/orb
