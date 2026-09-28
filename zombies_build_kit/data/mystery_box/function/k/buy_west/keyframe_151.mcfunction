# mystery_box created via BDEngine

data merge entity @e[type=item_display,tag=mystery_box_149,distance=..1,limit=1,sort=nearest] {transformation:[-0.0011f,0f,0f,0.562225f,0f,0.0011f,0f,1.8044125f,0f,0f,-0.0011f,0.4218921875f,0f,0f,0f,1f],interpolation_duration:0}
scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 151
schedule function mystery_box:k/buy_west/check_pause_151 0.1s
