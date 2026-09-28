# mystery_box created via BDEngine

playsound zbk:mystery_box.close master @a[distance=..10] ~ ~ ~ 1 1

scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 152
schedule function mystery_box:k/buy_north/check_pause_152 0.1s
