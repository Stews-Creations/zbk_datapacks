function zbk:map_elements/crafting_bench/marker/snap_facing
# Fit the existing asset to 3 blocks wide, 1.95 tall and 1 deep, with floor anchored; face the placer.
summon item_display ~ ~ ~ {view_range:0.5f,Tags:["cb_runtime","cb_model","cb_new_runtime"],item_display:"none",brightness:{block:15,sky:15},item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk:map_elements/workbench"}},transformation:{translation:[-0.000000f,0.489796f,0.006955f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.500000f,0.979592f,0.989181f]}}
data modify entity @e[type=item_display,tag=cb_new_runtime,limit=1] Rotation[0] set from entity @s Rotation[0]
# Three 1-block boxes form a 3-wide, 1-high, 1-deep upper-half hitbox.
execute rotated as @s positioned ^-1 ^1 ^ run summon interaction ~ ~ ~ {Tags:["cb_runtime","cb_interaction","cb_new_runtime"],width:1f,height:1f,response:true}
execute rotated as @s positioned ^0 ^1 ^ run summon interaction ~ ~ ~ {Tags:["cb_runtime","cb_interaction","cb_new_runtime"],width:1f,height:1f,response:true}
execute rotated as @s positioned ^1 ^1 ^ run summon interaction ~ ~ ~ {Tags:["cb_runtime","cb_interaction","cb_new_runtime"],width:1f,height:1f,response:true}
scoreboard players operation @e[tag=cb_new_runtime] cb_id = #owner cb_id
tag @e[tag=cb_new_runtime] remove cb_new_runtime
