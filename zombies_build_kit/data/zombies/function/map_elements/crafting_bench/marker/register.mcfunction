execute align xz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~
scoreboard players add #next cb_id 1
scoreboard players operation @s cb_id = #next cb_id
tag @s remove cb_new
