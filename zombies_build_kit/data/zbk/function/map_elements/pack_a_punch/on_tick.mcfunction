# Keep prompt recovery and stale-cycle reset outside the active-machine gate.
# They must still repair state when no loaded animation marker is active.

# ===================================
# PACK-A-PUNCH SUBMODULE - TICK
# ===================================
# Runs every game tick for Pack-a-Punch system

# ===== SPAWN EGG DETECTION =====
# Detect and process placement of Pack-a-Punch marker bats
execute if entity @e[type=minecraft:bat,name="Pack a Punch Marker"] run function zbk:map_elements/pack_a_punch/spawning/spawn

# ===== ANIMATIONS =====
# X-axis spin around entity-position pivot (animated translation)
function zbk:map_elements/pack_a_punch/animations/spin_rotaters
# Blue glow particles around the rotaters
function zbk:map_elements/pack_a_punch/animations/glow_effect

# ===== PER-MARKER BUY CYCLE DISPATCHER =====
# pap_anim is set to 0 on_buy + pap_anim_active tag added; advances each tick, fires phase
# functions at thresholds. An existence gate skips cycle work when no loaded machine is active.
# Each phase runs as/at the owning marker so all selectors stay machine-local.
function zbk:map_elements/pack_a_punch/cycle/tick_active

# Heal stale prompts if the machine is idle and no delayed revert is pending.
execute as @e[type=text_display,tag=pack_a_punch_purchase_text,tag=!pap_text_revert_pending] at @s unless entity @e[type=marker,distance=..3,tag=pack_a_punch,tag=pap_claim_ready,limit=1,sort=nearest] unless entity @e[type=marker,distance=..3,tag=pack_a_punch,tag=pap_busy,limit=1,sort=nearest] unless entity @e[type=marker,distance=..3,tag=pack_a_punch,tag=pap_song_lock,limit=1,sort=nearest] run data modify entity @s text set value [{"text":"Purchase","color":"gold","bold":true}]

# Safety net: fully reset stale state after the cycle completes (claim_timeout also clears explicitly).
# 281 = one tick past the last scheduled phase (270 = claim_timeout) plus a bit of slack.
execute as @e[type=marker,tag=pap_anim_active] if score @s pap_anim matches 281.. at @s run function zbk:map_elements/pack_a_punch/cycle/force_reset
