# Internal whole-electric-quest reset, including when Der Eisendrache is being deselected.
function zbk_der_eisendrache:quest/bows/electric/reforging/management/clear_runtime
scoreboard players set #sequence de_er_state 0
scoreboard players set @e[type=marker,tag=de_er_marker] de_er_state 0
scoreboard players set #time de_er_tick 0
scoreboard players set #flash de_er_tick 0
