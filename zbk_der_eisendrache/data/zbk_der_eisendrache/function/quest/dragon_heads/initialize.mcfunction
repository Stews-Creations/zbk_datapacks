# ===================================
# DRAGON HEADS QUEST - INITIALIZE
# ===================================
# Purpose: Set up 3-head dragon quest system
# Called from maps/der_eisendrache/quest/initialize.mcfunction and game reset

# Global configuration
scoreboard players set #dragon_souls_needed dragon_heads_config 7

# Global completion tracking
scoreboard players set #dragon_heads_complete dragon_heads_complete 0
scoreboard players set #all_dragons_complete dragon_heads_complete 0

# ===== RESET ALL EXISTING HEADS =====
# Minecraft 26.2 block displays respect skull rotation, so preserve the authored forward direction explicitly.
execute as @e[type=block_display,tag=quest_dragon_head] run data merge entity @s {block_state:{Name:"minecraft:dragon_head",Properties:{rotation:"8"}}}
execute as @e[type=block_display,tag=quest_mini_dragon_head] run data merge entity @s {block_state:{Name:"minecraft:dragon_head",Properties:{rotation:"8"}}}

# Large heads - reset to stone mode
execute as @e[type=block_display,tag=quest_dragon_head] run function zbk_der_eisendrache:quest/dragon_heads/core/reset_head

# Reset rotations to base orientation for each head
execute as @e[type=block_display,tag=quest_dragon_head_1] run data merge entity @s {transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute as @e[type=block_display,tag=quest_dragon_head_2] run data merge entity @s {transformation:{left_rotation:[0.0f,-0.7071068f,0.0f,0.7071068f]}}
execute as @e[type=block_display,tag=quest_dragon_head_3] run data merge entity @s {transformation:{left_rotation:[0.0f,1.0f,0.0f,0.0f]}}

# Mini heads - reset to inactive
execute as @e[type=block_display,tag=quest_mini_dragon_head] run function zbk_der_eisendrache:quest/dragon_heads/core/reset_mini_head

# Kill any lingering soul mannequins
kill @e[tag=quest_dragon_soul_mannequin]

# Kill any existing dragon bow display and interaction
kill @e[tag=quest_dragon_bow]
kill @e[tag=quest_dragon_bow_interaction]

function zbk:api/debug/info {f:"QUEST",m:"3-head dragon quest system initialized"}
