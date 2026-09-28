# Context: one plate at its position. Count after updating so a newly completed plate contributes immediately.

execute unless entity @s[tag=de_ag_plate_complete] run function zbk_der_eisendrache:anti_gravity/plates/tick_marker
execute if entity @s[tag=de_ag_plate_complete] run scoreboard players add #plates_complete de_ag_cycle 1
