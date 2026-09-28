# Refresh decoy presence separately for each normal-enemy batch, then clear it.
# This contract depends on the batch not creating or removing decoys while it runs.

# ===================================
# BEHAVIOR MODULE - TICK
# ===================================
# Runs every game tick for mob AI behavior

# ===== AREA MARKERS =====
# Detect and place area block markers from spawn eggs
function zombies:behavior/areas/zombie_barrier_block/place_zombie_block_marker
function zombies:behavior/areas/player_block/place_player_block_marker

# ===== ENEMY RELOCATION =====
execute as @e[type=marker,tag=enemy_relocation_anchor] at @s run function zombies:behavior/relocation/process_anchor

# Shield routing reuses the enemy loops; resolve owner availability once per tick.
execute store success score #rs_guard_active temp if entity @a[scores={rs_owned=1,rs_durability=1..}]

# ===== ZOMBIE BEHAVIOR =====
# Single selector loop per mob type (like the @a player loop)
execute store success score #monkey_available temp if entity @e[type=zombie,tag=monkey_bomb_decoy,limit=1]
execute as @e[type=zombified_piglin,tag=!turned_zombie] at @s run function zombies:behavior/on_tick_as_piglin
# Only this synchronous enemy batch may reuse the availability result.
scoreboard players reset #monkey_available temp
execute as @e[type=zombified_piglin,tag=turned_zombie] at @s run function zombies:combat/weapons/pack_a_punch/elements/turned/on_tick
execute as @e[type=zombified_piglin,tag=bf_burning] at @s run function zombies:combat/weapons/pack_a_punch/elements/blast_furnace/burn_tick
execute as @e[type=zombified_piglin,tag=tw_launching] at @s run function zombies:combat/weapons/pack_a_punch/elements/thunder_wall/launch_tick
execute as @e[type=zombified_piglin,tag=fw_marked] at @s run function zombies:combat/weapons/pack_a_punch/elements/fireworks/mark_tick
# Refresh after the intervening effects, before processing dogs.
execute store success score #monkey_available temp if entity @e[type=zombie,tag=monkey_bomb_decoy,limit=1]
execute as @e[type=wolf] at @s run function zombies:behavior/on_tick_as_wolf
scoreboard players reset #monkey_available temp

# ===== CRAWLER DISPLAY CLEANUP =====
# Remove dying displays after death animation finishes
execute as @e[type=item_display,tag=aj.block_bench_crawler.root,tag=crawler_dying] unless entity @s[tag=aj.block_bench_crawler.animation.animation_model_die.playing] run function animated_java:block_bench_crawler/remove/this
