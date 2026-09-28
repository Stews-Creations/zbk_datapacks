# Middle destination for one linked tram route.
summon minecraft:marker ~ ~ ~ {Tags:["tram_marker","tram_middle"]}
scoreboard players set @e[type=marker,tag=tram_middle,distance=..0.1,limit=1,sort=nearest] tram_link_id 0
tellraw @s [{"text":"[Tram] ","color":"gold"},{"text":"Created a middle marker. Configure its Link ID with the Build Stick.","color":"green"}]
