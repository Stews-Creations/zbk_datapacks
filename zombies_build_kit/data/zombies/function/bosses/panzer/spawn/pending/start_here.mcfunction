# Plays the full Panzer spawn warning before the controller and model appear.
# Runs at: desired Panzer spawn location.

execute as @a at @s run playsound zombies:mob.panzer.spawn hostile @s ~ ~ ~ 1 1
summon minecraft:marker ~ ~ ~ {Tags:["panzer_spawn_pending","panzer_spawn_new","zbk.round_blocker"]}
scoreboard players set @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] panzer_spawn_timer 60
tag @e[type=minecraft:marker,tag=panzer_spawn_new,distance=..0.25,sort=nearest,limit=1] remove panzer_spawn_new
