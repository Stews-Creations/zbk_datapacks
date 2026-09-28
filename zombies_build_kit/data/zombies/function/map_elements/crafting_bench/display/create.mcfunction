# Marker context; one shared progress display per bench.
scoreboard players operation #bar_owner cb_id = @s cb_id
scoreboard players set #bar_exists cb_bar 0
execute as @e[type=text_display,tag=cb_progress,distance=..3] if score @s cb_id = #bar_owner cb_id run scoreboard players set #bar_exists cb_bar 1
execute if score #bar_exists cb_bar matches 1 run return 0
execute rotated as @s positioned ^ ^1.55 ^-0.10 run summon text_display ~ ~ ~ {Tags:["cb_runtime","cb_progress","cb_progress_new"],billboard:"fixed",text:"",alignment:"center",line_width:240,background:-1342177280,shadow:true,brightness:{block:15,sky:15},transformation:{translation:[0f,0f,0f],left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],scale:[0.4f,0.4f,0.4f]}}
data modify entity @e[type=text_display,tag=cb_progress_new,limit=1] Rotation[0] set from entity @s Rotation[0]
scoreboard players operation @e[type=text_display,tag=cb_progress_new] cb_id = #bar_owner cb_id
scoreboard players set @e[type=text_display,tag=cb_progress_new] cb_bar -1
scoreboard players set #progress cb_time 0
execute as @e[type=text_display,tag=cb_progress_new] run function zombies:map_elements/crafting_bench/display/apply_progress
tag @e[type=text_display,tag=cb_progress_new] remove cb_progress_new
