# ===================================
# BARRIER SUBMODULE - TICK AS PLAYER
# ===================================
# Runs every game tick for each player
#
# Context: Executed as @a at @s

# ===== DECREMENT REPAIR COOLDOWN =====
# Reduce cooldown timer for players who have one active
execute if score @s barrier_repair_cooldown matches 1.. run scoreboard players remove @s barrier_repair_cooldown 1
