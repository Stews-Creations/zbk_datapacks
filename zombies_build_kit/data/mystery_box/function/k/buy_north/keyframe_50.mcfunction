# mystery_box created via BDEngine

tag @e[tag=mystery_box_gun, sort=nearest, limit=1] remove spin
tag @e[tag=mystery_box_gun, sort=nearest, limit=1] remove speed_slow
function zombies:map_elements/mystery_box/buy/check_bear

# Enable claiming if gun was selected (not teddy bear)
execute unless score #teddy_bear_roll temp matches 1 run scoreboard players set @e[tag=mystery_box_location,type=marker,distance=..5,limit=1,sort=nearest] mystery_box_can_claim 1
data merge entity @e[type=item_display,tag=mystery_box_149,distance=..1,limit=1,sort=nearest] {transformation:[0f,0f,1f,0.546875f,0f,1f,0f,1.554375f,-1f,0f,0f,0.3125f,0f,0f,0f,1f],interpolation_duration:2,start_interpolation:0}
scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 50
schedule function mystery_box:k/buy_north/check_pause_50 0.1s
