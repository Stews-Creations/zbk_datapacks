# ===================================
# ADVANCEMENT RECOVERY SYSTEM
# ===================================
# Purpose: Defensive fix for stuck advancement states
# Revokes gun advancements that are granted but shouldn't be
#
# Called every tick from: combat/weapons/on_tick.mcfunction
# ===================================

# Semi-auto guns - revoke if trigger_lock is active and advancement is stuck granted
execute as @a[scores={ray_gun_trigger_lock=1..},advancements={zbk:ray_gun=true}] run advancement revoke @s only zbk:ray_gun
function zbk:dispatch/extension/combat/weapons/advancement_recovery/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
execute as @a[scores={special_equipment_use_lock=1..},advancements={zbk:trip_mine=true}] run advancement revoke @s only zbk:trip_mine

# Full-auto guns - revoke if not firing

# Single-shot/burst guns - revoke any stuck granted state

execute as @a[advancements={zbk:bo3_weapon=true}] run advancement revoke @s only zbk:bo3_weapon
