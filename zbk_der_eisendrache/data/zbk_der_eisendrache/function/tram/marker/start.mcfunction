# Start marker with complete route settings.
summon minecraft:marker ~ ~ ~ {Tags:["tram_marker","tram_start"]}
scoreboard players set @e[type=marker,tag=tram_start,distance=..0.1,limit=1,sort=nearest] tram_link_id 0
scoreboard players set @e[type=marker,tag=tram_start,distance=..0.1,limit=1,sort=nearest] tram_start_delay 5
scoreboard players set @e[type=marker,tag=tram_start,distance=..0.1,limit=1,sort=nearest] tram_auto_start 1
tellraw @s [{"text":"[Tram] ","color":"gold"},{"text":"Created a start marker. Configure its Link ID, delay, and auto-start with the Build Stick.","color":"green"}]
