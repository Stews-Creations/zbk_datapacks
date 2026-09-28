# ===================================
# PLAYER SETUP - RESET PLAYER
# ===================================
# Purpose: Wipe all per-player scoreboard values for ALL players (uses *).
# Intended for dev/testing use — provides a clean slate without a full /reload.
# ===================================


# ===== PLAYER POINTS =====
scoreboard players reset * player_points

# ===== WEAPON SYSTEM =====
scoreboard players reset * active_weapon
scoreboard players reset * weapon_count

# Slot 1
scoreboard players reset * gun_1
scoreboard players reset * ammo_1
scoreboard players reset * max_ammo_1
scoreboard players reset * shots_1
scoreboard players reset * fire_1
scoreboard players reset * cooldown_1
scoreboard players reset * reserve_ammo_1
scoreboard players reset * max_reserve_1
scoreboard players reset * is_reloading_1
scoreboard players reset * reload_timer_1

# Slot 2
scoreboard players reset * gun_2
scoreboard players reset * ammo_2
scoreboard players reset * max_ammo_2
scoreboard players reset * shots_2
scoreboard players reset * fire_2
scoreboard players reset * cooldown_2
scoreboard players reset * reserve_ammo_2
scoreboard players reset * max_reserve_2
scoreboard players reset * is_reloading_2
scoreboard players reset * reload_timer_2

# Slot 3
scoreboard players reset * gun_3
scoreboard players reset * ammo_3
scoreboard players reset * max_ammo_3
scoreboard players reset * shots_3
scoreboard players reset * fire_3
scoreboard players reset * cooldown_3
scoreboard players reset * reserve_ammo_3
scoreboard players reset * max_reserve_3
scoreboard players reset * is_reloading_3
scoreboard players reset * reload_timer_3

# Trigger locks
scoreboard players reset * pistol_trigger_lock
scoreboard players reset * ray_gun_trigger_lock
function zbk:dispatch/extension/player/setup/reset_player/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
scoreboard players reset * rainbow_rifle_trigger_lock
scoreboard players reset * melee_timer

# Grenade
scoreboard players reset * grenade_ammo
scoreboard players reset * max_grenade_ammo

# Special equipment
scoreboard players reset * special_equipment
scoreboard players reset * special_equipment_ammo
scoreboard players reset * max_special_equipment_ammo

# ===== OTHER PLAYER SCOREBOARDS =====
scoreboard players reset * barrier_repair_cooldown

# ===== PLAYER STATS =====
scoreboard players reset * stat_kills
scoreboard players reset * stat_downs
scoreboard players reset * stat_revives
scoreboard players reset * stat_headshots
scoreboard players reset * stat_doors

# ===== DISABLE TRIGGERS =====
# Point triggers
scoreboard players reset @a reset_points
scoreboard objectives setdisplay sidebar
scoreboard players set @a reset_points 0

scoreboard players reset @a give_points
scoreboard players set @a give_points 0

scoreboard players reset @a give_10k_points
scoreboard players set @a give_10k_points 0

# Stats trigger
scoreboard players reset @a show_stats
scoreboard players set @a show_stats 0

# Weapon triggers
scoreboard players reset @a give_pistol
scoreboard players set @a give_pistol 0

scoreboard players reset @a give_rifle
scoreboard players set @a give_rifle 0

scoreboard players reset @a give_shotgun
scoreboard players set @a give_shotgun 0

scoreboard players reset @a give_double_barrel
scoreboard players set @a give_double_barrel 0

scoreboard players reset @a give_sniper
scoreboard players set @a give_sniper 0

scoreboard players reset @a give_lmg
scoreboard players set @a give_lmg 0

scoreboard players reset @a give_flamethrower
scoreboard players set @a give_flamethrower 0

scoreboard players reset @a give_grenade_launcher
scoreboard players set @a give_grenade_launcher 0

scoreboard players reset @a give_rainbow_rifle
scoreboard players set @a give_rainbow_rifle 0

scoreboard players reset @a give_ray_gun
scoreboard players set @a give_ray_gun 0



scoreboard players reset @a give_monkey_bomb
scoreboard players set @a give_monkey_bomb 0

scoreboard players reset @a give_trip_mine
scoreboard players set @a give_trip_mine 0
