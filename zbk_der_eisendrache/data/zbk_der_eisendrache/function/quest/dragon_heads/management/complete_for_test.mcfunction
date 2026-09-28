# The operator shortcut must rebuild the same completion snapshot used by the normal tick path.
# Otherwise mini-head and reward consumers could observe values from before the forced completion.

# Complete the placed dragon heads and rebuild one ready-to-claim bow reward.
# Run with the existing heads and reward marker loaded; does not move placements.
execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"Select Der Eisendrache (Der Eisendrache) first.","color":"red"}
execute unless entity @e[type=marker,tag=quest_dragon_bow_spawn] run return run tellraw @s {"text":"The dragon-bow reward marker must be placed and loaded first.","color":"red"}
execute unless entity @e[type=block_display,tag=quest_dragon_head_1] run return run tellraw @s {"text":"Dragon head 1 must be placed and loaded first.","color":"red"}
execute unless entity @e[type=block_display,tag=quest_dragon_head_2] run return run tellraw @s {"text":"Dragon head 2 must be placed and loaded first.","color":"red"}
execute unless entity @e[type=block_display,tag=quest_dragon_head_3] run return run tellraw @s {"text":"Dragon head 3 must be placed and loaded first.","color":"red"}

kill @e[tag=quest_dragon_soul_mannequin]
scoreboard players set @e[type=block_display,tag=quest_dragon_head] dragon_head_cooldown 0
scoreboard players set @e[type=block_display,tag=quest_dragon_head] dragon_head_anim 0
execute as @e[type=block_display,tag=quest_dragon_head] run scoreboard players operation @s dragon_head_souls = #dragon_souls_needed dragon_heads_config
execute as @e[type=block_display,tag=quest_dragon_head] unless score @s dragon_head_mode matches 3 at @s run function zbk_der_eisendrache:quest/dragon_heads/modes/complete
function zbk_der_eisendrache:quest/dragon_heads/core/read_completion
function zbk_der_eisendrache:quest/dragon_heads/mini_heads/tick

# Repeating the test replaces the transient reward without duplicating it.
kill @e[tag=quest_dragon_bow]
kill @e[tag=quest_dragon_bow_interaction]
scoreboard players set #all_dragons_complete dragon_heads_complete 0
function zbk_der_eisendrache:quest/dragon_heads/core/check_completion
tellraw @s {"text":"Dragon heads complete. The new base bow is ready at the placed reward marker.","color":"green"}
