$data modify entity @e[type=marker,tag=cutscene_end_start,limit=1] data.speed set value $(speed)
$tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"End game pan speed set to $(speed) blocks/sec","color":"green"}]
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
