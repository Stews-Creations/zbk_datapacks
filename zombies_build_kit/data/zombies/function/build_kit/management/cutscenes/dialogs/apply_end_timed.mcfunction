$data modify entity @e[type=marker,tag=cutscene_end_timed,limit=1] data.length set value $(length)
$tellraw @s [{"text":"[Cutscene] ","color":"gold","bold":true},{"text":"End game timed cutscene set to $(length)s","color":"green"}]
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
