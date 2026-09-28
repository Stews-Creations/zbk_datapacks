execute unless score #active zbk.de matches 1 run return 0
$kill @e[tag=de_el_fire_$(id)_runtime]
$summon marker ~ ~ ~ {Tags:["de_el_fire_runtime","de_el_fire_fx","de_el_fire_$(id)_runtime"],Rotation:[0f,0f]}
$summon interaction ~ ~-4.25 ~ {Tags:["de_el_fire_runtime","de_el_fire_target","de_el_fire_$(id)_runtime"],width:5.5f,height:5f,response:false}
$scoreboard players set @e[type=interaction,tag=de_el_fire_$(id)_runtime] de_el_fire_id $(id)
