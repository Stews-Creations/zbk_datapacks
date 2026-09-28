# Reset Dragon Heads Quest System
# Resets all heads to initial state

execute unless score #active zbk.de matches 1 run return 0

# Reset global completion tracking
scoreboard players set #dragon_heads_complete dragon_heads_complete 0
scoreboard players set #all_dragons_complete dragon_heads_complete 0

# Reset all large heads to stone mode
execute as @e[type=block_display,tag=quest_dragon_head] run function zbk_der_eisendrache:quest/dragon_heads/core/reset_head

# Reset rotations to base orientation for each head
execute as @e[type=block_display,tag=quest_dragon_head_1] run data merge entity @s {transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute as @e[type=block_display,tag=quest_dragon_head_2] run data merge entity @s {transformation:{left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f]}}
execute as @e[type=block_display,tag=quest_dragon_head_3] run data merge entity @s {transformation:{left_rotation:[0.0f,1.0f,0.0f,0.0f]}}

# Reset all mini heads to inactive
execute as @e[type=block_display,tag=quest_mini_dragon_head] run function zbk_der_eisendrache:quest/dragon_heads/core/reset_mini_head

# Kill any lingering soul mannequins
kill @e[tag=quest_dragon_soul_mannequin]

# Kill any existing dragon bow display and interaction
kill @e[tag=quest_dragon_bow]
kill @e[tag=quest_dragon_bow_interaction]

tellraw @a [{"text":"[Dragon Heads] ","color":"gold"},{"text":"Dragon heads quest has been reset","color":"yellow"}]
