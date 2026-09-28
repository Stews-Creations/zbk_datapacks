# Read the current loaded-head snapshot for activation; keep particle rendering after all activation checks.

# Mini Dragon Heads - Tick
# Check each mini head and update based on linked large head status

# ===== MINI HEAD 1 =====
# If large head 1 is complete (mode=3) and mini head 1 isn't active yet, activate it
execute if score #loaded_head_1 dragon_heads_complete matches 1 as @e[type=block_display,tag=quest_mini_dragon_head_1,tag=!quest_mini_dragon_active] run function zbk_der_eisendrache:quest/dragon_heads/mini_heads/activate

# ===== MINI HEAD 2 =====
# If large head 2 is complete (mode=3) and mini head 2 isn't active yet, activate it
execute if score #loaded_head_2 dragon_heads_complete matches 1 as @e[type=block_display,tag=quest_mini_dragon_head_2,tag=!quest_mini_dragon_active] run function zbk_der_eisendrache:quest/dragon_heads/mini_heads/activate

# ===== MINI HEAD 3 =====
# If large head 3 is complete (mode=3) and mini head 3 isn't active yet, activate it
execute if score #loaded_head_3 dragon_heads_complete matches 1 as @e[type=block_display,tag=quest_mini_dragon_head_3,tag=!quest_mini_dragon_active] run function zbk_der_eisendrache:quest/dragon_heads/mini_heads/activate

# Show fire particles for all active mini heads
execute as @e[type=block_display,tag=quest_mini_dragon_active] at @s run function zbk_der_eisendrache:quest/dragon_heads/mini_heads/particles
