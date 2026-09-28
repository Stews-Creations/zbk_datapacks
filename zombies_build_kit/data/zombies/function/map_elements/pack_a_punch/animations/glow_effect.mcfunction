# ===================================
# PACK-A-PUNCH - GLOW EFFECT
# ===================================
# Small periodic flash at each rotater for a subtle CoD-PaP glow look.
# ===================================

# Skip if no rotaters exist
execute unless entity @e[type=item_display,tag=pack_a_punch_rotaters,limit=1] run return 0

# Throttle: flash once every 10 ticks (2 flashes per second)
scoreboard players add #pap_glow_tick pack_a_punch 1
execute if score #pap_glow_tick pack_a_punch matches 10.. run scoreboard players set #pap_glow_tick pack_a_punch 0
execute unless score #pap_glow_tick pack_a_punch matches 0 run return 0

# Three small subtle bursts at left, middle, and right (auto-rotates per facing)
execute as @e[type=item_display,tag=pack_a_punch_rotaters] at @s rotated as @s run particle minecraft:end_rod ^1 ^0.25 ^ 0.3 0.25 0.3 0.01 1 normal
execute as @e[type=item_display,tag=pack_a_punch_rotaters] at @s rotated as @s run particle minecraft:end_rod ^0 ^0.25 ^ 0.3 0.25 0.3 0.01 1 normal
execute as @e[type=item_display,tag=pack_a_punch_rotaters] at @s rotated as @s run particle minecraft:end_rod ^-1 ^0.25 ^ 0.3 0.25 0.3 0.01 1 normal
