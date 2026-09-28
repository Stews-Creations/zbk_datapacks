# ===================================
# TRAM MODULE - TICK
# ===================================
# Purpose: Handle reward interactions, visuals, timeout, and auto-return.
# ===================================

# Fallback for players whose interaction advancement was already granted.
execute as @e[type=interaction,tag=tram_reward_interaction] at @s if data entity @s interaction as @p[distance=..6,limit=1,sort=nearest] run function zbk_der_eisendrache:tram/reward/claim/interact

# Reward timeout and auto-return lifecycle.
execute as @e[type=marker,tag=tram_reward_spawn,scores={tram_r_state=1..}] at @s run function zbk_der_eisendrache:tram/reward/tick_marker

# Count down each player's missing-Fuse announcement cooldown.
execute as @a[scores={tram_fuse_cd=1..}] run scoreboard players remove @s tram_fuse_cd 1

# Route right-clicks on the stationary call console through its manager.
function zbk_der_eisendrache:tram/call_console/on_tick

# Advance the temporary console-light sequence for the Tram 1 easter egg.
function zbk_der_eisendrache:tram/easter_egg/on_tick

# Unclaimed Tram 1 rewards use the same presentation as powerup drops.
execute as @e[type=item_display,tag=tram_reward_preview] at @s run tp @s ~ ~ ~ ~-2 ~
execute as @e[type=item_display,tag=tram_reward_preview] at @s run particle minecraft:happy_villager ~ ~ ~ 0.5 0.5 0.5 0 1 force
