# mystery_box created via BDEngine

data merge entity @e[type=item_display,tag=mystery_box_149,distance=..1,limit=1,sort=nearest] {transformation:[0f,0f,-1f,0.453125f,0f,1f,0f,1.531875f,1f,0f,0f,0.6875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 101
schedule function mystery_box:k/buy_south/check_pause_101 0.1s
