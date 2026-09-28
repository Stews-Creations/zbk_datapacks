# Update large heads first, then snapshot completion once for mini-head and reward consumers.
# Do not move the snapshot ahead of state transitions or retain it as a cross-tick entity cache.

# ===================================
# DRAGON HEADS QUEST - MAIN TICK
# ===================================
# Runs every game tick for all 3 dragon heads

# ===== LARGE HEADS =====
# Dormant heads activate only through incoming souls; no idle handler is needed.

# Run mode functions for each head in active mode (1)
execute as @e[type=block_display,tag=quest_dragon_head,scores={dragon_head_mode=1}] at @s run function zbk_der_eisendrache:quest/dragon_heads/modes/active_mode

# ===== MINI HEADS =====
# Update mini head states based on linked large head completion
function zbk_der_eisendrache:quest/dragon_heads/core/read_completion
function zbk_der_eisendrache:quest/dragon_heads/mini_heads/tick

# ===== COMPLETION CHECK =====
# Check if all 3 heads are complete
function zbk_der_eisendrache:quest/dragon_heads/core/check_completion

# ===== BOW PARTICLES =====
# Show glow particles around the dragon bow if it exists
execute as @e[type=item_display,tag=quest_dragon_bow] at @s run function zbk_der_eisendrache:quest/bows/default/particles
