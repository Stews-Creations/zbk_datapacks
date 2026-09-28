# @s = Music text display

execute if entity @s[tag=being_looked_at,tag=!hovered] at @s run playsound minecraft:block.note_block.hat master @a[distance=..10] ~ ~ ~ 0.5 2

execute if score @e[type=marker,tag=spawn_menu_v2_marker,limit=1] spawn_menu_v2_music matches 1 if entity @s[tag=being_looked_at] run data modify entity @s text set value [{"text":"> Music      ON <","color":"yellow"}]
execute if score @e[type=marker,tag=spawn_menu_v2_marker,limit=1] spawn_menu_v2_music matches 1 unless entity @s[tag=being_looked_at] run data modify entity @s text set value [{"text":"Music      ","color":"gray"},{"text":"ON","color":"green"}]
execute if score @e[type=marker,tag=spawn_menu_v2_marker,limit=1] spawn_menu_v2_music matches 0 if entity @s[tag=being_looked_at] run data modify entity @s text set value [{"text":"> Music      OFF <","color":"yellow"}]
execute if score @e[type=marker,tag=spawn_menu_v2_marker,limit=1] spawn_menu_v2_music matches 0 unless entity @s[tag=being_looked_at] run data modify entity @s text set value [{"text":"Music      ","color":"gray"},{"text":"OFF","color":"dark_gray"}]

execute if entity @s[tag=being_looked_at] run tag @s add hovered
execute unless entity @s[tag=being_looked_at] run tag @s remove hovered
