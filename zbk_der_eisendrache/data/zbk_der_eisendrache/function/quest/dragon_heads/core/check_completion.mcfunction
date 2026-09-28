# Consume the loaded-head snapshot refreshed by the orchestrator; do not infer completion from stale saved presence.

# Check if all 3 dragon heads are complete
# Sets #all_dragons_complete flag when all 3 heads reach mode 3

# Count completed heads
scoreboard players set #dragon_heads_complete dragon_heads_complete 0
execute if score #loaded_head_1 dragon_heads_complete matches 1 run scoreboard players add #dragon_heads_complete dragon_heads_complete 1
execute if score #loaded_head_2 dragon_heads_complete matches 1 run scoreboard players add #dragon_heads_complete dragon_heads_complete 1
execute if score #loaded_head_3 dragon_heads_complete matches 1 run scoreboard players add #dragon_heads_complete dragon_heads_complete 1

# Set global flag if all 3 complete (only trigger once)
execute if score #dragon_heads_complete dragon_heads_complete matches 3 unless score #all_dragons_complete dragon_heads_complete matches 1 run function zbk_der_eisendrache:quest/dragon_heads/core/all_complete
