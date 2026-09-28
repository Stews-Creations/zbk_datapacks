# mystery_box created via BDEngine

data merge entity @e[type=text_display,tag=mystery_box_35,distance=..1,limit=1,sort=nearest] {transformation:[-1f,0f,0f,0.500625f,0f,1f,0f,0.436875f,0f,0f,-1f,0.1258637188f,0f,0f,0f,1f],interpolation_duration:0}
scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 51
schedule function mystery_box:k/buy_south/check_pause_51 0.1s
