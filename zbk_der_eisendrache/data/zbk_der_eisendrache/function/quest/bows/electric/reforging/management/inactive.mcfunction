# Called on the active-to-inactive transition and by slower reconciliation.
# Synchronize marker state after clearing an interrupted ascent, without reconstructing runtime.

function zbk_der_eisendrache:quest/bows/electric/reforging/management/clear_runtime
execute if score #sequence de_er_state matches 1 run scoreboard players set #sequence de_er_state 0
scoreboard players operation @e[type=marker,tag=de_er_marker] de_er_state = #sequence de_er_state
