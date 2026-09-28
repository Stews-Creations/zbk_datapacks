# ===================================
# BARRIER MANAGEMENT - UPDATE LIGHT BLOCKS
# ===================================
# Purpose: Replace light blocks in a 3-block radius based on barrier state
#
# Context: Executed at boards_spawn marker location
# Param: barrier_state from nearest barrier marker
# ===================================

# Get the barrier state from nearest barrier marker
execute store result score #barrier_temp barrier_state run scoreboard players get @e[type=marker,tag=barrier,distance=..3,limit=1,sort=nearest] barrier_state

# ===== STATE 6: DOWNGRADE LIGHT (ALLOW ZOMBIES THROUGH) =====
# Replace light[level=6] with light[level=5] in 3-block radius (include blocks below)
execute if score #barrier_temp barrier_state matches 6 run fill ~-3 ~-1 ~-3 ~3 ~2 ~3 minecraft:light[level=5] replace minecraft:light[level=6]

# ===== STATE 5 (from 6): UPGRADE LIGHT (BLOCK ZOMBIES AGAIN) =====
# Replace light[level=5] with light[level=6] when first board is repaired (include blocks below)
execute if score #barrier_temp barrier_state matches 5 run fill ~-3 ~-1 ~-3 ~3 ~2 ~3 minecraft:light[level=6] replace minecraft:light[level=5]
