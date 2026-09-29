summon item_display ~ ~ ~ {Tags:["pm_v2_runtime","pm_v2_model","pm_v2_child"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk:map_elements/perks/stamina_up"}},item_display:"fixed",transformation:{translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},view_range:0.35f}
data modify entity @e[type=item_display,tag=pm_v2_child,limit=1] Rotation set from entity @s Rotation
# Cabinet fronts oppose the saved placement facing.
execute as @e[type=item_display,tag=pm_v2_child,limit=1] at @s run rotate @s ~180 ~
summon interaction ~ ~ ~ {Tags:["pm_v2_runtime","pm_v2_interaction","pm_v2_child"],width:1.25f,height:2.4f,response:true}
execute rotated as @s run summon text_display ^ ^1 ^-0.675 {Tags:["pm_v2_runtime","pm_v2_label","pm_v2_child"],billboard:"fixed",background:0,shadow:true,brightness:{block:15,sky:15},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.65f,0.65f,0.65f]},text:{text:"Stamina Up\n2000",color:"yellow"},view_range:0.0390625f}
function zbk:map_elements/perks/machines/display/label_orientation
