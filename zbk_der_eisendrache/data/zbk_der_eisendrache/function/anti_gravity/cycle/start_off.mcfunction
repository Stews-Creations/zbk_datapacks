# Include the 220-tick shutdown so 1,200-3,600 inactive ticks remain afterward.
function zbk_der_eisendrache:anti_gravity/management/deactivate
execute store result score #timer de_ag_cycle run random value 1200..3600
execute as @a[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Cycle] ","color":"light_purple"},{"text":"Inactive phase selected: ","color":"gray"},{"score":{"name":"#timer","objective":"de_ag_cycle"},"color":"yellow"},{"text":" ticks.","color":"gray"}]
scoreboard players add #timer de_ag_cycle 220
