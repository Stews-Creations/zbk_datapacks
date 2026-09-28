# ===================================
# PACK-A-PUNCH - SPIN ROTATERS
# ===================================
# Continuous X-axis spin animation for the rotaters item_display.
# Advances one 45-degree step every 3 ticks (~1.2 sec per full revolution).
# Interpolation (duration:3 set at spawn) smooths between steps.
# ===================================

# Skip if no rotaters exist (avoids per-tick scoreboard churn on empty maps)
execute unless entity @e[type=item_display,tag=pack_a_punch_rotaters,limit=1] run return 0

scoreboard players add #pap_spin_tick pack_a_punch 1
execute if score #pap_spin_tick pack_a_punch matches 3.. run function zbk:map_elements/pack_a_punch/animations/spin_advance
