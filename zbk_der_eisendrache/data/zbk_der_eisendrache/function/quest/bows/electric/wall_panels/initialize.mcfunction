# Reset unfinished attempts and presentation, then rebuild; completed quest progress stays saved.
kill @e[tag=de_el_panel_runtime]
tag @a remove de_el_panel_runner
function zbk_der_eisendrache:quest/bows/electric/wall_panels/route/reset
scoreboard players set @e[type=marker,tag=de_el_panel_marker] de_ep_present 0
scoreboard players set @e[type=marker,tag=de_el_panel_marker] de_ep_near 0
scoreboard players set @e[type=marker,tag=de_el_panel_marker] de_ep_close 0
scoreboard players set @e[type=marker,tag=de_el_panel_marker] de_ep_touch 0
scoreboard players set @e[type=marker,tag=de_el_panel_marker] de_ep_flash 0
scoreboard players set @e[type=marker,tag=de_el_panel_marker] de_ep_test 0
execute unless score #active zbk.de matches 1 run return 0
execute as @e[type=marker,tag=de_el_panel_marker] at @s rotated as @s run function zbk_der_eisendrache:quest/bows/electric/wall_panels/display/sync with entity @s data
