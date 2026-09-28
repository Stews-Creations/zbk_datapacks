# Preserve the gameplay hitbox; visual geometry is generated from blockbench/static_props.
summon minecraft:interaction ~ ~ ~ {width:1.0f,height:1.6f,Tags:["explosive_barrel_interaction"]}
summon minecraft:item_display ~ ~ ~ {Tags:["explosive_barrel_display"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk:props/explosive_barrel"}},item_display:"none",view_range:1f,width:2f,height:1.75f,transformation:{translation:[0f,0f,0f],scale:[1f,1f,1f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,1f,0f,0f]}}
