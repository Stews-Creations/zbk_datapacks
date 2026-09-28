# Reward location for one linked tram route.
summon minecraft:marker ~ ~ ~ {Tags:["tram_marker","tram_reward_spawn"]}
scoreboard players set @e[type=marker,tag=tram_reward_spawn,distance=..0.1,limit=1,sort=nearest] tram_link_id 0
scoreboard players set @e[type=marker,tag=tram_reward_spawn,distance=..0.1,limit=1,sort=nearest] tram_r_state 0
scoreboard players set @e[type=marker,tag=tram_reward_spawn,distance=..0.1,limit=1,sort=nearest] tram_r_timer 0
tellraw @s [{"text":"[Tram] ","color":"gold"},{"text":"Created a reward marker. Configure its Link ID with the Build Stick.","color":"green"}]
