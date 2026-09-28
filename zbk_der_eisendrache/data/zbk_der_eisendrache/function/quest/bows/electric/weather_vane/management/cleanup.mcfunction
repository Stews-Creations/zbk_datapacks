# Works after Der Eisendrache deselection. Restore authored walls and clear transient progress.
execute as @e[type=marker,tag=de_el_wall_marker,scores={de_el_broken=1}] at @s run function zbk_der_eisendrache:quest/bows/electric/weather_vane/wall/restore with entity @s data
kill @e[tag=de_el_vane_runtime]
kill @e[tag=de_bow_1_runtime]
scoreboard players set @e[type=marker,tag=de_el_vane_marker] de_el_stage 0
scoreboard players set @e[type=marker,tag=de_el_vane_marker] de_el_timer 0
scoreboard players reset #1 de_bow_owner
scoreboard players reset #1 de_bow_ready

function zbk_der_eisendrache:quest/bows/electric/fires/initialize
scoreboard players reset #1 de_bow_started
