execute unless score #active zbk.de matches 1 run return 0
summon item_display ~ ~0.7 ~ {Tags:["de_eb_runtime","de_eb_content","de_eb_arrow"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:quest/bows/arrows/lightning","minecraft:enchantment_glint_override":true}},item_display:"fixed",brightness:{block:15,sky:15},view_range:4f,width:4f,height:4f,transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.325f,0.325f,0.325f]}}
tp @e[type=item_display,tag=de_eb_arrow,limit=1] ~ ~0.7 ~ ~ 45
execute if score #phase de_eb_state matches 2 run data modify entity @e[type=item_display,tag=de_eb_arrow,limit=1] Glowing set value 1b
scoreboard players operation @e[tag=de_eb_content] de_eb_state = #phase de_eb_state
