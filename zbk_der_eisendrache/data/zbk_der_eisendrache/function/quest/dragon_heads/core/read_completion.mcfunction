# This snapshot is valid only until the current consumers finish.
# Every entry point that invokes those consumers must refresh it after changing head modes.

# Tick-local loaded-head snapshot. Refresh after head updates and before both consumers.
execute store success score #loaded_head_1 dragon_heads_complete if entity @e[type=block_display,tag=quest_dragon_head_1,scores={dragon_head_mode=3}]
execute store success score #loaded_head_2 dragon_heads_complete if entity @e[type=block_display,tag=quest_dragon_head_2,scores={dragon_head_mode=3}]
execute store success score #loaded_head_3 dragon_heads_complete if entity @e[type=block_display,tag=quest_dragon_head_3,scores={dragon_head_mode=3}]
