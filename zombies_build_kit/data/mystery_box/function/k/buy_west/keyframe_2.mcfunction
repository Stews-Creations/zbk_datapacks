# mystery_box created via BDEngine

tag @e[tag=mystery_box_gun, sort=nearest, limit=1] add spin
tag @e[tag=mystery_box_gun, sort=nearest, limit=1] add speed_fast

data merge entity @e[type=item_display,tag=mystery_box_11,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,1f,0f,0f,1.0078125f,0f,0f,1f,0.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_12,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,0.5f,0f,0f,1.3828125f,0f,0f,1f,0.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_13,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,1f,0f,0f,1.0078125f,0f,0f,1f,0.1875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_14,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,0.5f,0f,0f,1.3828125f,0f,0f,1f,0.1875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_15,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,1f,0f,0f,1.0078125f,0f,0f,1f,1.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_16,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,0.5f,0f,0f,1.3828125f,0f,0f,1f,1.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_17,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,1f,0f,0f,1.0078125f,0f,0f,1f,1.1875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_18,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,0.5f,0f,0f,1.3828125f,0f,0f,1f,1.1875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_19,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,1f,0f,0f,1.0078125f,0f,0f,1f,-0.3125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_20,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,0.5f,0f,0f,1.3828125f,0f,0f,1f,-0.3125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_21,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,1f,0f,0f,1.0078125f,0f,0f,1f,-0.8125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_22,distance=..1,limit=1,sort=nearest] {transformation:[0f,-0.125f,0f,0.0446831562f,0.5f,0f,0f,1.3828125f,0f,0f,1f,-0.8125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
data merge entity @e[type=item_display,tag=mystery_box_149,distance=..1,limit=1,sort=nearest] {transformation:[-0.0011f,0f,0f,0.562225f,0f,0.0011f,0f,0.8044125f,0f,0f,-0.0011f,0.4218921875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 2
schedule function mystery_box:k/buy_west/check_pause_2 0.1s
