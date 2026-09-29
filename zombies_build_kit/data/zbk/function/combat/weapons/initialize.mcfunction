function zbk:combat/weapons/events/extension/initialize/before_reset
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
function zbk:combat/weapons/special_equipment/rocket_shield/initialize

# ===================================
# COMBAT WEAPONS - INITIALIZE
# ===================================
# Purpose: Reset all weapon state for @s and give starting pistol.
# Called from:
#   - player/setup/setup_player (full player init / late join)
#   - player/down_system/lifecycle/on_death (weapon-only reset on bleedout)
# ===================================

# ===== WEAPON SYSTEM =====
# The base pack tracking
scoreboard players set @s active_weapon 0
scoreboard players set @s weapon_count 0
# Bleed-out and full player setup remove the Bowie Knife upgrade. Downs/revives do not call this initializer.
scoreboard players set @s bowie_knife 0

# Reset slot 1
scoreboard players set @s gun_1 0
scoreboard players set @s ammo_1 0
scoreboard players set @s max_ammo_1 0
scoreboard players set @s shots_1 0
scoreboard players set @s fire_1 0
scoreboard players set @s cooldown_1 0
scoreboard players set @s reserve_ammo_1 0
scoreboard players set @s max_reserve_1 0
scoreboard players set @s is_reloading_1 0
scoreboard players set @s reload_timer_1 0
scoreboard players set @s tier_1 0
scoreboard players set @s element_1 0

# Reset slot 2
scoreboard players set @s gun_2 0
scoreboard players set @s ammo_2 0
scoreboard players set @s max_ammo_2 0
scoreboard players set @s shots_2 0
scoreboard players set @s fire_2 0
scoreboard players set @s cooldown_2 0
scoreboard players set @s reserve_ammo_2 0
scoreboard players set @s max_reserve_2 0
scoreboard players set @s is_reloading_2 0
scoreboard players set @s reload_timer_2 0
scoreboard players set @s tier_2 0
scoreboard players set @s element_2 0

# Reset slot 3
scoreboard players set @s gun_3 0
scoreboard players set @s ammo_3 0
scoreboard players set @s max_ammo_3 0
scoreboard players set @s shots_3 0
scoreboard players set @s fire_3 0
scoreboard players set @s cooldown_3 0
scoreboard players set @s reserve_ammo_3 0
scoreboard players set @s max_reserve_3 0
scoreboard players set @s is_reloading_3 0
scoreboard players set @s reload_timer_3 0
scoreboard players set @s tier_3 0
scoreboard players set @s element_3 0

# Semi-auto trigger locks
scoreboard players reset @s pistol_trigger_lock
scoreboard players reset @s ray_gun_trigger_lock
function zbk:combat/weapons/events/extension/initialize/after_slot_reset
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
scoreboard players reset @s rainbow_rifle_trigger_lock
scoreboard players reset @s melee_timer

# Grenade ammo
scoreboard players set @s grenade_ammo 2
scoreboard players set @s max_grenade_ammo 2

# Special equipment
scoreboard players set @s special_equipment 0
scoreboard players set @s special_equipment_ammo 0
scoreboard players set @s max_special_equipment_ammo 0
scoreboard players reset @s special_equipment_use_lock

# ===== REVOKE WEAPON ADVANCEMENTS =====
advancement revoke @s only zbk:ray_gun
function zbk:combat/weapons/events/extension/initialize/after_ray_gun_revoke
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
advancement revoke @s only zbk:death_machine
advancement revoke @s only zbk:trip_mine

# Revoke cooldown advancements
advancement revoke @s only zbk:ray_gun_cooldown
function zbk:combat/weapons/events/extension/initialize/before_starting_weapon
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# ===== GIVE STARTING WEAPON =====
function zbk:combat/weapons/guns/mr6/give/main
# BO3 starting loadout: 8 loaded, 32 spare, with capacity for 80 spare.
scoreboard players set @s reserve_ammo_1 32

function zbk:combat/weapons/guns/bo3/input/cancel
scoreboard players set @s bo3_was_down 0
