# ===================================
# BARRIER W3 MANAGEMENT - UPDATE LIGHT BLOCKS
# ===================================
# Context: Executed at boards_spawn_w3 marker location

execute store result score #barrier_temp bw3_state run scoreboard players get @e[type=marker,tag=barrier_w3,distance=..3,limit=1,sort=nearest] bw3_state

# State 6: Downgrade light (allow zombies through)
execute if score #barrier_temp bw3_state matches 6 run fill ~-3 ~-1 ~-3 ~3 ~2 ~3 minecraft:light[level=5] replace minecraft:light[level=6]

# State 5 (from 6): Upgrade light (block zombies again)
execute if score #barrier_temp bw3_state matches 5 run fill ~-3 ~-1 ~-3 ~3 ~2 ~3 minecraft:light[level=6] replace minecraft:light[level=5]
