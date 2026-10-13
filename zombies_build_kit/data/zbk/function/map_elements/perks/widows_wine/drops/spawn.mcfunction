execute unless score #ww_owner stats matches 1.. run return 0
summon item_display ~ ~0.4 ~ {Tags:["ww_spider","ww_new_spider"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk:special_equipment/widows_spider"}},billboard:"fixed",teleport_duration:1,brightness:{sky:15,block:15},transformation:{translation:[0f,0f,0f],scale:[0.45f,0.45f,0.45f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},view_range:0.5f}
scoreboard players operation @e[tag=ww_new_spider] perk_epoch = #current perk_epoch
scoreboard players set @e[tag=ww_new_spider] ww_timer 600
execute as @e[tag=ww_new_spider] run scoreboard players operation @s ww_owner = #ww_owner stats
execute as @e[tag=ww_new_spider] at @s run function zbk:map_elements/perks/widows_wine/drops/particles
tag @e[tag=ww_new_spider] remove ww_new_spider
