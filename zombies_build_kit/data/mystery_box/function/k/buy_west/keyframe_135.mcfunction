# mystery_box created via BDEngine

data merge entity @e[type=item_display,tag=mystery_box_149,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.3125f,0f,1f,0f,0.7671875f,0f,0f,-1f,0.4375f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 135
schedule function mystery_box:k/buy_west/check_pause_135 0.1s
