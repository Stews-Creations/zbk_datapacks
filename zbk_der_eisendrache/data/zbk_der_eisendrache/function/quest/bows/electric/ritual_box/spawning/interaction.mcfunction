execute unless score #active zbk.de matches 1 run return 0
summon interaction ~ ~ ~ {Tags:["de_eb_runtime","de_eb_content","de_eb_interaction"],width:1f,height:1f,response:true}
$summon text_display ~ ~2.3 ~ {Tags:["de_eb_runtime","de_eb_content","de_eb_label"],billboard:"center",background:0,shadow:true,text:{text:"$(label)",color:"aqua"},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.6f,0.6f,0.6f]}}
scoreboard players operation @e[tag=de_eb_content] de_eb_state = #phase de_eb_state
