$function zombies:map_elements/rocket_shield/spawning/$(part)
# Marker yaw is persistent placement configuration. Keep the part upright.
data modify entity @e[type=item_display,tag=rs_part_new,limit=1] Rotation[0] set from entity @s Rotation[0]
$summon interaction ~ ~ ~ {Tags:["rs_part_runtime","rs_$(part)_runtime","rs_part_interaction","rs_part_new"],width:1f,height:1f,response:true}
$summon text_display ~ ~0.5 ~ {Tags:["rs_part_runtime","rs_$(part)_runtime","rs_part_text","rs_part_new"],text:"",billboard:"fixed",background:0,shadow:true,alignment:"center",transformation:{translation:[0f,0f,0f],left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],scale:[1f,1f,1f]}}
# Save yaw for the prompt offset and its inverse proximity origin.
data modify entity @e[type=text_display,tag=rs_part_new,limit=1] Rotation[0] set from entity @s Rotation[0]
# Move the model, hitbox, and prompt together using the persistent marker yaw.
execute rotated as @s as @e[tag=rs_part_new] positioned as @s run tp @s ^ ^ ^0.70
# Keep the two-line prompt near the part center and slightly toward the viewer.
execute as @e[type=text_display,tag=rs_part_new] at @s run tp @s ^ ^ ^-0.60
# Move only the mechanism lettering forward; retain the proximity-check anchor.
execute as @e[type=text_display,tag=rs_part_new,tag=rs_mechanism_runtime] run data modify entity @s transformation.translation[2] set value -0.15f
execute as @e[type=item_display,tag=rs_part_new] run data merge entity @s {brightness:{block:15,sky:15}}
execute as @e[type=text_display,tag=rs_part_new] run data merge entity @s {brightness:{block:15,sky:15}}
scoreboard players operation @e[tag=rs_part_new] rs_candidate = #rs_owner rs_candidate
scoreboard players operation @e[tag=rs_part_new] rs_epoch = #run rs_epoch
scoreboard players set @e[type=text_display,tag=rs_part_new] rs_prompt 0
tag @e[tag=rs_part_new] remove rs_part_new
