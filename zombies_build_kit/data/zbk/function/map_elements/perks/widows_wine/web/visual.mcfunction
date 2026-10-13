summon block_display ~ ~ ~ {Tags:["ww_web_visual","ww_new_web"],block_state:{Name:"minecraft:cobweb"},transformation:{translation:[-0.55f,-1.3f,-0.55f],scale:[1.1f,1.5f,1.1f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},view_range:0.4f}
ride @e[tag=ww_new_web,limit=1] mount @s
tag @e[tag=ww_new_web] remove ww_new_web
