# ===================================
# FULL-AUTO FIRING SYSTEM
# ===================================
# Purpose: Bridges missed using_item ticks for full-auto weapons
# on_use sets auto_firing=4 each tick using_item triggers; this decays and calls fire as backup
#
# Called every tick from: combat/weapons/on_tick.mcfunction
# ===================================

# Early exit if no one is firing a full-auto weapon
execute unless entity @a[scores={auto_firing=1..}] run return 0

scoreboard players remove @a[scores={auto_firing=1..}] auto_firing 1

# LMG (gun_id: 4)

# Flame Thrower (gun_id: 2)

# Death Machine powerup (always full-auto while held; ignores gun_id/active_weapon)
execute as @a[scores={auto_firing=1..},tag=death_machine_active] at @s run function zbk:combat/powerups/death_machine/fire_tick
