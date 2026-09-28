# Context: cutscene camera. Broadcast once, then latch this camera so later ticks skip the title.

title @a times 10 70 20
title @a title {"text":"GAME OVER","color":"dark_red","bold":true}
title @a subtitle ["",{"text":"Rounds Survived ","color":"red"},{"score":{"name":"#global","objective":"wave.round"},"color":"yellow"}]
tag @s add cs_showed_title
