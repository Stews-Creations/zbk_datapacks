# mystery_box created via BDEngine

# Debug: Track keyframe execution
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[KEYFRAME] ","color":"yellow"},{"text":"box_close_east:5 - Box close animation complete","color":"white"}]

data merge entity @e[type=text_display,tag=mystery_box_10,distance=..1,limit=1,sort=nearest] {transformation:[0f,0f,-1f,0.125f,0f,1f,0f,0.4371875f,1f,0f,0f,0.484375f,0f,0f,0f,1f],interpolation_duration:0}
data merge entity @e[type=item_display,tag=mystery_box_11,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.6877387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,0.296875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_12,distance=..1,limit=1,sort=nearest] {transformation:[-0.5f,0f,0f,0.3127387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,0.296875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_13,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.6877387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,0.796875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_14,distance=..1,limit=1,sort=nearest] {transformation:[-0.5f,0f,0f,0.3127387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,0.796875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_15,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.6877387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,-0.703125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_16,distance=..1,limit=1,sort=nearest] {transformation:[-0.5f,0f,0f,0.3127387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,-0.703125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_17,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.6877387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,-0.203125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_18,distance=..1,limit=1,sort=nearest] {transformation:[-0.5f,0f,0f,0.3127387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,-0.203125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_19,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.6877387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,1.296875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_20,distance=..1,limit=1,sort=nearest] {transformation:[-0.5f,0f,0f,0.3127387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,1.296875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_21,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.6877387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,1.796875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_22,distance=..1,limit=1,sort=nearest] {transformation:[-0.5f,0f,0f,0.3127387188f,0f,0.125f,0f,0.806328125f,0f,0f,-1f,1.796875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_149,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.6875f,0f,1f,0f,0.5969281915f,0f,0f,1f,0.546875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
scoreboard players set @s mystery_box_frame 5

# Complete only this root's location. Gameplay is owned by zombies.
execute at @s as @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] run function zbk:map_elements/mystery_box/animation/state/close_complete

tag @s remove anim_box_close_east
scoreboard players reset @s mystery_box_frame
schedule function mystery_box:k/box_close_east/check_loop 0.1s
