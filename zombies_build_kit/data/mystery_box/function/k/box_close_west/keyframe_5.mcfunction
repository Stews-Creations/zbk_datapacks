# mystery_box created via BDEngine

# Debug: Track keyframe execution
execute as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[KEYFRAME] ","color":"yellow"},{"text":"box_close_west:5 - Box close animation complete","color":"white"}]

data merge entity @e[type=text_display,tag=mystery_box_10,distance=..1,limit=1,sort=nearest] {transformation:[0f,0f,1f,0.875f,0f,1f,0f,0.4375f,-1f,0f,0f,0.5f,0f,0f,0f,1f],interpolation_duration:0}
data merge entity @e[type=item_display,tag=mystery_box_11,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.3122612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,0.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_12,distance=..1,limit=1,sort=nearest] {transformation:[0.5f,0f,0f,0.6872612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,0.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_13,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.3122612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,0.1875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_14,distance=..1,limit=1,sort=nearest] {transformation:[0.5f,0f,0f,0.6872612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,0.1875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_15,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.3122612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,1.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_16,distance=..1,limit=1,sort=nearest] {transformation:[0.5f,0f,0f,0.6872612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,1.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_17,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.3122612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,1.1875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_18,distance=..1,limit=1,sort=nearest] {transformation:[0.5f,0f,0f,0.6872612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,1.1875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_19,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.3122612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,-0.3125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_20,distance=..1,limit=1,sort=nearest] {transformation:[0.5f,0f,0f,0.6872612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,-0.3125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_21,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.3122612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,-0.8125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_22,distance=..1,limit=1,sort=nearest] {transformation:[0.5f,0f,0f,0.6872612812f,0f,0.125f,0f,0.806640625f,0f,0f,1f,-0.8125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_149,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.3125f,0f,1f,0f,0.5972406915f,0f,0f,-1f,0.4375f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
scoreboard players set @s mystery_box_frame 5

# Complete only this root's location. Gameplay is owned by zombies.
execute at @s as @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] run function zombies:map_elements/mystery_box/animation/state/close_complete

tag @s remove anim_box_close_west
scoreboard players reset @s mystery_box_frame
schedule function mystery_box:k/box_close_west/check_loop 0.1s
