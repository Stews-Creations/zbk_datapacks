# ===================================
# WAVES MODULE - TICK AS PLAYER
# ===================================
# Purpose: Per-player wave system logic
#
# Called from: on_tick_as_player.mcfunction (root orchestrator)
# Runs as @a at @s
# ===================================

# Apply dog round fog effect
execute if score #global wave.is_dog_round matches 1 run function zombies:waves/special_rounds/dog/effects
