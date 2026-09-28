# mystery_box created via BDEngine

# Mark box as ready to buy and track last animation
execute as @e[tag=anim_spawn_north] at @s run scoreboard players set @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] mystery_box_ready 1
execute as @e[tag=anim_spawn_north] at @s run scoreboard players set @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] mystery_box_last_anim 2

# Re-enable box particles now that spawn animation is complete
execute as @e[tag=anim_spawn_north] at @s run tag @e[type=marker,tag=mystery_box_location,distance=..5,limit=1,sort=nearest] remove disabled

data merge entity @e[type=text_display,tag=mystery_box_10,distance=..1,limit=1,sort=nearest] {transformation:[1f,0f,0f,0.484375f,0f,1f,0f,0.4371875f,0f,0f,1f,0.875f,0f,0f,0f,1f],interpolation_duration:0}
scoreboard players reset @s mystery_box_frame
scoreboard players set @s mystery_box_frame 80
tag @s remove anim_spawn_north
scoreboard players reset @s mystery_box_frame
schedule function mystery_box:k/spawn_north/check_loop 0.1s
