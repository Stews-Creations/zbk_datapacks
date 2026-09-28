# mystery_box created via BDEngine

playsound zombies:mystery_box.close master @a[distance=..10] ~ ~ ~ 1 1

scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 152
schedule function mystery_box:k/buy_east/check_pause_152 0.1s
