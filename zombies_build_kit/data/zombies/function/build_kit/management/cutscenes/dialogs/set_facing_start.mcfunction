# Update start game timed marker facing to player's current rotation
execute store result entity @e[type=marker,tag=cutscene_start_timed,limit=1] data.yaw float 1 run data get entity @s Rotation[0]
execute store result entity @e[type=marker,tag=cutscene_start_timed,limit=1] data.pitch float 1 run data get entity @s Rotation[1]
tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Start game camera facing updated to your current direction","color":"green"}]
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
