$data modify entity @e[type=marker,tag=cutscene_start_start,limit=1] data.speed set value $(speed)
$tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"Start game pan speed set to $(speed) blocks/sec","color":"green"}]
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
