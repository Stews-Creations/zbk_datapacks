# ===================================
# PACK-A-PUNCH MODULE - LOAD
# ===================================
# Purpose: Initialize Pack-a-Punch system scoreboards
#
# Dependencies: `stats` objective (created in combat/weapons/on_load) — used by
# initialize for the #pap_buyer_temp staleness reset and the in-flight buyer restore.
# Asserted idempotently below in case load order ever shifts.
# ===================================

# Defensive: assert `stats` exists before initialize uses it.
scoreboard objectives add stats dummy

# Trigger for spawn egg
# (enable is done per-player in map_elements/pack_a_punch/enable_triggers)
scoreboard objectives add give_pack_a_punch_egg trigger

# Animation state (rotater spin counter)
scoreboard objectives add pack_a_punch dummy

# Per-marker buy-cycle tick counter (0..280 during a buy, unset when idle)
scoreboard objectives add pap_anim dummy

# Initialize Pack-a-Punch system
function zombies:map_elements/pack_a_punch/initialize
