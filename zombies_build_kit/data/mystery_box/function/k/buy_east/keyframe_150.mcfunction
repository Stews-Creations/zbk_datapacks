# mystery_box created via BDEngine

data merge entity @e[type=text_display,tag=mystery_box_35,distance=..1,limit=1,sort=nearest] {transformation:[0f,0f,-0.0011f,0.1258637188f,0f,0.0011f,0f,0.436875f,0.0011f,0f,0f,0.4999993125f,0f,0f,0f,1f],interpolation_duration:0}
data merge entity @e[type=item_display,tag=mystery_box_149,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.6875f,0f,1f,0f,0.429375f,0f,0f,1f,0.546875f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 150
schedule function mystery_box:k/buy_east/check_pause_150 0.1s
