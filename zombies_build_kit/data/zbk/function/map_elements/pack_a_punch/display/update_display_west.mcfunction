# Pack-a-Punch visual, facing west (90deg Y)
# Core (body)
summon item_display ~ ~1.5 ~ {view_range:0.5f,Tags:["pack_a_punch_core","pack_a_punch_item","pack_a_punch_ui"],brightness:{block:15,sky:15},shadow_strength:0.0f,item:{id:"minecraft:stick",count:1,components:{item_model:"zbk:pack_a_punch"}},transformation:{left_rotation:[0f,-0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}
# Flag
summon item_display ~-0.65 ~0.9 ~-0.75 {view_range:0.5f,Tags:["pack_a_punch_flag","pack_a_punch_flag_west","pack_a_punch_item","pack_a_punch_ui"],brightness:{block:15,sky:15},shadow_strength:0.0f,item:{id:"minecraft:stick",count:1,components:{item_model:"zbk:pack_a_punch_flag"}},transformation:{left_rotation:[0f,-0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0.67f,0.625f,0.78f],scale:[1f,1f,1f]}}
# Rotaters (single combined model, X-axis spin via animated left_rotation+translation)
summon item_display ~ ~0.75 ~ {view_range:0.5f,Rotation:[-90f,0f],Tags:["pack_a_punch_rotaters","pack_a_punch_item","pack_a_punch_ui"],brightness:{block:15,sky:15},shadow_strength:0.0f,interpolation_duration:3,teleport_duration:1,item:{id:"minecraft:stick",count:1,components:{item_model:"zbk:pack_a_punch_rotaters"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.25f,0f],scale:[1f,1f,1f]}}
# Title sign
summon text_display ~0.1 ~1.5 ~ {view_range:0.5f,Tags:["pack_a_punch_title","pack_a_punch_text","pack_a_punch_ui"],billboard:"fixed",background:0,shadow:false,brightness:{block:15,sky:15},transformation:{left_rotation:[0f,0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.75f,1.75f,1.75f]},text:[{"text":"","font":"zbk:pack_title"}]}
# Raygun sign
summon text_display ~0.1 ~1.6 ~ {view_range:0.5f,Tags:["pack_a_punch_raygun","pack_a_punch_text","pack_a_punch_ui"],billboard:"fixed",background:0,shadow:false,brightness:{block:15,sky:15},transformation:{left_rotation:[0f,0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},text:[{"text":"","font":"zbk:pack_raygun"}]}
# Interaction hitbox: 2.75 wide x 0.5 deep x 0.5 tall strip along +X front face (six 0.5-cube entities spaced 0.5 along Z)
summon minecraft:interaction ~0.5 ~0.5 ~-1.25 {width:0.5f,height:0.75f,response:true,Tags:["pack_a_punch_interaction","pack_a_punch_ui"]}
summon minecraft:interaction ~0.5 ~0.5 ~-0.75 {width:0.5f,height:0.75f,response:true,Tags:["pack_a_punch_interaction","pack_a_punch_ui"]}
summon minecraft:interaction ~0.5 ~0.5 ~-0.25 {width:0.5f,height:0.75f,response:true,Tags:["pack_a_punch_interaction","pack_a_punch_ui"]}
summon minecraft:interaction ~0.5 ~0.5 ~0.25 {width:0.5f,height:0.75f,response:true,Tags:["pack_a_punch_interaction","pack_a_punch_ui"]}
summon minecraft:interaction ~0.5 ~0.5 ~0.75 {width:0.5f,height:0.75f,response:true,Tags:["pack_a_punch_interaction","pack_a_punch_ui"]}
summon minecraft:interaction ~0.5 ~0.5 ~1.25 {width:0.5f,height:0.75f,response:true,Tags:["pack_a_punch_interaction","pack_a_punch_ui"]}
# Purchase prompt text (change via: data merge entity @e[tag=pack_a_punch_purchase_text,...] {text:[...]})
summon text_display ~0.70 ~0.65 ~ {view_range:0.5f,Tags:["pack_a_punch_purchase_text","pack_a_punch_text","pack_a_punch_ui"],billboard:"fixed",background:0,shadow:false,brightness:{block:15,sky:15},transformation:{left_rotation:[0f,0.7071068f,0f,0.7071068f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},text:[{"text":"Purchase","color":"gold","bold":true}]}
