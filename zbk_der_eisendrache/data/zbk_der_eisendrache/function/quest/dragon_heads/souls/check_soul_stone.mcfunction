# Check if a dragon head is nearby and trigger soul collection
# Run as the soul marker stone item entity, at its location
# Each head works independently - only process for heads within range

# Debug
tellraw @a[tag=debug] [{"text":"[3-Head Soul] ","color":"aqua"},{"text":"Soul stone detected","color":"white"}]

# ===== STONE MODE ACTIVATION (per head) =====
# Only activate heads in stone mode that are within range of THIS soul
# Use "at @s" to keep position at the soul stone for activation effects
execute as @e[type=block_display,tag=quest_dragon_head_1,scores={dragon_head_mode=0},distance=..10,limit=1] at @s run function zbk_der_eisendrache:quest/dragon_heads/modes/activate
execute as @e[type=block_display,tag=quest_dragon_head_2,scores={dragon_head_mode=0},distance=..10,limit=1] at @s run function zbk_der_eisendrache:quest/dragon_heads/modes/activate
execute as @e[type=block_display,tag=quest_dragon_head_3,scores={dragon_head_mode=0},distance=..10,limit=1] at @s run function zbk_der_eisendrache:quest/dragon_heads/modes/activate

# ===== SOUL COLLECTION (per head) =====
# Head 1 - collect if active, not on cooldown, and no mannequin already animating
execute if entity @e[type=block_display,tag=quest_dragon_head_1,scores={dragon_head_mode=1,dragon_head_cooldown=0},distance=..10] unless entity @e[tag=quest_dragon_soul_mannequin,tag=soul_target_1] as @e[type=block_display,tag=quest_dragon_head_1,scores={dragon_head_mode=1,dragon_head_cooldown=0},distance=..10,limit=1] run function zbk_der_eisendrache:quest/dragon_heads/souls/collect_soul

# Head 2 - collect if active, not on cooldown, and no mannequin already animating
execute if entity @e[type=block_display,tag=quest_dragon_head_2,scores={dragon_head_mode=1,dragon_head_cooldown=0},distance=..10] unless entity @e[tag=quest_dragon_soul_mannequin,tag=soul_target_2] as @e[type=block_display,tag=quest_dragon_head_2,scores={dragon_head_mode=1,dragon_head_cooldown=0},distance=..10,limit=1] run function zbk_der_eisendrache:quest/dragon_heads/souls/collect_soul

# Head 3 - collect if active, not on cooldown, and no mannequin already animating
execute if entity @e[type=block_display,tag=quest_dragon_head_3,scores={dragon_head_mode=1,dragon_head_cooldown=0},distance=..10] unless entity @e[tag=quest_dragon_soul_mannequin,tag=soul_target_3] as @e[type=block_display,tag=quest_dragon_head_3,scores={dragon_head_mode=1,dragon_head_cooldown=0},distance=..10,limit=1] run function zbk_der_eisendrache:quest/dragon_heads/souls/collect_soul

# Always kill the stone marker item after checking
kill @s
