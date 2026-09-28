# ===================================
# DETECT RELOAD SYSTEM
# ===================================
# Purpose: Trigger auto-reload when magazine is empty
#
# Called from: combat/weapons/on_tick.mcfunction
# ===================================

# Slot 1: Auto-reload if magazine empty, has reserve, and not already reloading
execute as @a[scores={ammo_1=..0,reserve_ammo_1=1..,is_reloading_1=0,gun_1=1..}] run function zombies:combat/weapons/management/reload_slot_1

# Slot 2: Auto-reload if magazine empty, has reserve, and not already reloading
execute as @a[scores={ammo_2=..0,reserve_ammo_2=1..,is_reloading_2=0,gun_2=1..}] run function zombies:combat/weapons/management/reload_slot_2

# Slot 3: Auto-reload if magazine empty, has reserve, and not already reloading
execute as @a[scores={ammo_3=..0,reserve_ammo_3=1..,is_reloading_3=0,gun_3=1..}] run function zombies:combat/weapons/management/reload_slot_3
