execute unless score #active zbk.de matches 1 run return 0
execute unless entity @s[type=marker,tag=de_el_panel_marker] run return 0
$kill @e[tag=de_el_panel_$(id)_runtime]
$summon item_display ~ ~ ~ {Tags:["de_el_panel_runtime","de_el_panel_$(id)_runtime"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:quest/bows/electric/wall_panels/off"}},item_display:"fixed",view_range:2f,width:2.4f,height:1.4f}
# Fixed item displays need a half-turn from the placement marker to expose the decorated face.
$tp @e[type=item_display,tag=de_el_panel_$(id)_runtime] ~ ~ ~ ~180 0
scoreboard players set @s de_ep_state -1
