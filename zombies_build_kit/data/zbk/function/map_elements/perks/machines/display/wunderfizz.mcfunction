summon item_display ~ ~-2 ~ {Tags:["pm_v2_runtime","pm_v2_model","pm_v2_child"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"zbk:map_elements/perks/wunderfizz"}},item_display:"fixed",transformation:{translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},view_range:0.35f}
data modify entity @e[type=item_display,tag=pm_v2_child,limit=1] Rotation set from entity @s Rotation
# Cabinet fronts oppose the saved placement facing.
execute as @e[type=item_display,tag=pm_v2_child,limit=1] at @s run rotate @s ~180 ~
