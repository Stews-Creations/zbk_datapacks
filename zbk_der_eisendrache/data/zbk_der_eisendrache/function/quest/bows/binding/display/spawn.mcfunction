execute unless score #active zbk.de matches 1 run return 0
$kill @e[tag=de_bow_$(quest)_runtime]
$summon item_display ~ ~0.6 ~ {Tags:["de_bow_runtime","de_bow_$(quest)_runtime","de_bow_new"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:quest/bows/arrows/$(model)_broken"}},item_display:"fixed",brightness:{block:15,sky:15},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.65f,0.65f,0.65f]}}
tp @e[type=item_display,tag=de_bow_new,limit=1] ~ ~0.6 ~ ~ 0
tag @e[tag=de_bow_new] remove de_bow_new
$summon interaction ~ ~ ~ {Tags:["de_bow_runtime","de_bow_$(quest)_runtime","de_bow_interaction","de_bow_new"],width:1.25f,height:1.5f,response:true}
$scoreboard players set @e[type=interaction,tag=de_bow_new] de_bow_kind $(quest)
tag @e[tag=de_bow_new] remove de_bow_new
$summon text_display ~ ~1.65 ~ {Tags:["de_bow_runtime","de_bow_$(quest)_runtime"],billboard:"center",background:0,shadow:true,brightness:{block:15,sky:15},text:{text:"bind upgrade quest",color:"aqua"},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.65f,0.65f,0.65f]}}
