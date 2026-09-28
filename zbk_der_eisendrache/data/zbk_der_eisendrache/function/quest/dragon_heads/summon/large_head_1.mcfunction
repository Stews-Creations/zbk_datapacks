# Summon Large Dragon Head 1

execute unless score #active zbk.de matches 1 run return 0

summon minecraft:block_display ~ ~ ~ {Tags:["quest_dragon_head","quest_dragon_head_1"],transformation:{scale:[2.0f,2.0f,2.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-1.0f,0.0f,-1.0f]},block_state:{Name:"minecraft:dragon_head",Properties:{rotation:"8"}},brightness:{sky:0,block:0}}

execute as @e[type=block_display,tag=quest_dragon_head_1,limit=1,sort=nearest,distance=..1] run function zbk_der_eisendrache:quest/dragon_heads/summon/init_head

tellraw @a [{"text":"[Dragon Heads] ","color":"gold"},{"text":"Large Dragon Head 1 summoned","color":"green"}]
