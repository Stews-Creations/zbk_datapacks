# One claim per persistent cabinet, shared by every player.
execute as @e[type=marker,tag=pm_v2,tag=perk_machine,tag=!wunderfizz] unless score @s pm_bonus_epoch = #current perk_epoch at @s run function zbk:map_elements/perks/management/claim_machine_bonus
# Retain standalone legacy bonus markers; a nearby model cabinet owns its own bonus.
execute as @e[type=marker,tag=perk_bonus] unless score @s pm_bonus_epoch = #current perk_epoch at @s unless entity @e[type=marker,tag=pm_v2,distance=..2] run function zbk:map_elements/perks/management/claim_bonus
