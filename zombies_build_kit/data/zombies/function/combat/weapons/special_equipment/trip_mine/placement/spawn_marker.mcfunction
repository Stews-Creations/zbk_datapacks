# ===================================
# SPAWN TRIP MINE MARKER
# ===================================
# Executor: placing player
# Position: chosen ground surface anchor

summon marker ~ ~ ~ {Tags:["trip_mine_marker","trip_mine_new","active_trip_mine"]}
execute store result entity @e[type=marker,tag=trip_mine_new,distance=..1,limit=1,sort=nearest] data.thrower_id int 1 run scoreboard players get @s id

execute at @e[type=marker,tag=trip_mine_new,distance=..1,limit=1,sort=nearest] run summon item_display ~ ~0.35 ~ {Tags:["special_equipment_display","trip_mine_display","trip_mine_new_display","grenade_display"],teleport_duration:2,brightness:{block:15,sky:15},shadow_radius:0.35f,shadow_strength:0.35f,item:{id:"minecraft:slime_ball",count:1,components:{"minecraft:item_model":"zbk:trip_mine"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]}}

# Link marker and display so the shared grenade explosion cleanup can remove both.
scoreboard players add #grenade_id_counter grenade_id 1
scoreboard players operation @e[type=marker,tag=trip_mine_new,distance=..1,limit=1,sort=nearest] grenade_id = #grenade_id_counter grenade_id
execute at @e[type=marker,tag=trip_mine_new,distance=..1,limit=1,sort=nearest] run scoreboard players operation @e[type=item_display,tag=trip_mine_new_display,sort=nearest,limit=1,distance=..1] grenade_id = #grenade_id_counter grenade_id
scoreboard players set @e[type=marker,tag=trip_mine_new,distance=..1,limit=1,sort=nearest] timer 20

execute at @e[type=marker,tag=trip_mine_new,distance=..1,limit=1,sort=nearest] run playsound minecraft:block.tripwire.attach player @a[distance=..16] ~ ~ ~ 0.8 1.2

tag @e[type=marker,tag=trip_mine_new,distance=..1] remove trip_mine_new
tag @e[type=item_display,tag=trip_mine_new_display,distance=..1] remove trip_mine_new_display
scoreboard players set #trip_mine_placed temp 1
