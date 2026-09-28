# End destination for one linked tram route.
summon minecraft:marker ~ ~ ~ {Tags:["tram_marker","tram_stop"]}
scoreboard players set @e[type=marker,tag=tram_stop,distance=..0.1,limit=1,sort=nearest] tram_link_id 0
tellraw @s [{"text":"[Tram] ","color":"gold"},{"text":"Created an end marker. Configure its Link ID with the Build Stick.","color":"green"}]
