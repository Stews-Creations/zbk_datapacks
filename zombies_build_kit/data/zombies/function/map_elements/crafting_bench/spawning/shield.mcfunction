# Stand the completed shield on the tabletop, facing the bench approach side.
execute rotated as @s positioned ^ ^1.609906 ^ run summon item_display ~ ~ ~ {view_range:0.5f,Tags:["cb_runtime","cb_shield","cb_shield_new"],item_display:"none",brightness:{block:15,sky:15},item:{id:"minecraft:shield",count:1,components:{"minecraft:item_model":"zombies:rocket_shield/shield"}},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.4f,1.043705f,0.65f]}}
data modify entity @e[type=item_display,tag=cb_shield_new,limit=1] Rotation set from entity @s Rotation
scoreboard players operation @e[type=item_display,tag=cb_shield_new] cb_id = @s cb_id
tag @e[type=item_display,tag=cb_shield_new] remove cb_shield_new
