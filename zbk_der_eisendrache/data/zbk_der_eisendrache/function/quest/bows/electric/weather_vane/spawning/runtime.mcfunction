# Called at the persistent marker with its authored heading; geometry only.
execute unless score #active zbk.de matches 1 run return 0
execute unless entity @s[type=marker,tag=de_el_vane_marker] run return 0
execute if entity @e[type=item_display,tag=de_el_vane_runtime] run return 0
summon item_display ~ ~0.5 ~ {Tags:["de_el_vane_runtime","de_el_vane_mount"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:quest/bows/electric/weather_vane/mount"}},item_display:"fixed",view_range:4.0f,width:4.0f,height:4.0f}
summon item_display ~ ~0.5 ~ {Tags:["de_el_vane_runtime","de_el_vane_head"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:quest/bows/electric/weather_vane/head"}},item_display:"fixed",teleport_duration:1,view_range:4.0f,width:4.0f,height:4.0f}
tp @e[type=item_display,tag=de_el_vane_runtime] ~ ~0.5 ~ ~ 0
summon interaction ~ ~ ~ {Tags:["de_el_vane_runtime","de_el_vane_target"],width:2.5f,height:2.25f,response:false}
