# Summon Mini Dragon Head 3 (linked to Large Head 3)
# Run this command where you want to place the indicator head

execute unless score #active zbk.de matches 1 run return 0

summon minecraft:block_display ~ ~ ~ {Tags:["quest_mini_dragon_head","quest_mini_dragon_head_3"],transformation:{scale:[0.5f,0.5f,0.5f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-0.25f,0.0f,-0.25f]},block_state:{Name:"minecraft:dragon_head",Properties:{rotation:"8"}},brightness:{sky:0,block:0}}

tellraw @a [{"text":"[Dragon Heads] ","color":"gold"},{"text":"Mini Dragon Head 3 summoned (linked to Head 3)","color":"green"}]
