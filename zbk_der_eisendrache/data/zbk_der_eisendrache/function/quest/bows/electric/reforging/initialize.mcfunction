# Refresh runtime; cancel an unfinished ascent but preserve a ready arrow and completed pickup.
function zbk_der_eisendrache:quest/bows/electric/reforging/management/clear_runtime
execute if score #sequence de_er_state matches 1 run scoreboard players set #sequence de_er_state 0
scoreboard players operation @e[type=marker,tag=de_er_marker] de_er_state = #sequence de_er_state
scoreboard players set #time de_er_tick 0
scoreboard players set #flash de_er_tick 0
execute unless score #active zbk.de matches 1 run return 0
execute if score #electric de_el_progress matches 3 as @e[type=marker,tag=de_er_marker] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/reforging/display/sync
