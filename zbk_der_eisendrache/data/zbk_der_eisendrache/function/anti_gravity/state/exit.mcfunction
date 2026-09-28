# Internal exit implementation.
execute if entity @s[tag=de_ag_effects] run function zbk_der_eisendrache:anti_gravity/movement/remove
function zbk_der_eisendrache:anti_gravity/audio/stop_for_player
tag @s remove de_ag_inside
tag @s remove de_ag_suppressed
execute if entity @s[tag=de_ag_debug] run tellraw @s [{"text":"[Anti-Gravity Bounds] ","color":"light_purple"},{"text":"Exited room.","color":"red"}]
