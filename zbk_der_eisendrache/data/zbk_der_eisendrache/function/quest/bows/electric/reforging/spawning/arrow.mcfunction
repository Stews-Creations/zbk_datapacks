execute unless score #active zbk.de matches 1 run return 0
summon item_display ~ ~0.6 ~ {Tags:["de_er_runtime","de_er_arrow"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk_der_eisendrache:quest/bows/arrows/lightning_tail"}},item_display:"fixed",brightness:{block:15,sky:15},view_range:4f,width:3f,height:20f,interpolation_duration:1,transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.65f,0.65f,0.65f]}}
tp @e[type=item_display,tag=de_er_arrow,limit=1] ~ ~0.6 ~ ~ 0
execute if score #sequence de_er_state matches 2 run data modify entity @e[type=item_display,tag=de_er_arrow,limit=1] item.components."minecraft:item_model" set value "zbk_der_eisendrache:quest/bows/arrows/lightning"
# Recover the correct visual height if a runtime display was removed mid-sequence.
scoreboard players operation #height de_er_tick = #time de_er_tick
execute if score #height de_er_tick matches 160.. run scoreboard players set #height de_er_tick 160
execute if score #sequence de_er_state matches 1 store result entity @e[type=item_display,tag=de_er_arrow,limit=1] transformation.translation[1] float 0.05 run scoreboard players get #height de_er_tick
