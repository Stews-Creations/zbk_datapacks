# Place the single persistent Der Eisendrache Fuse-drop marker at the command source.
execute unless score #active zbk.de matches 1 run tellraw @s [{"text":"[Fuse Drop] ","color":"dark_aqua","bold":true},{"text":"Select Der Eisendrache before placing the marker.","color":"red"}]
execute unless score #active zbk.de matches 1 run return 0
kill @e[type=minecraft:marker,tag=de_fuse_drop_marker]
summon minecraft:marker ~ ~ ~ {Tags:["de_fuse_drop_marker"]}
tellraw @s [{"text":"[Fuse Drop] ","color":"dark_aqua","bold":true},{"text":"Round 1 Fuse marker placed.","color":"aqua"}]
