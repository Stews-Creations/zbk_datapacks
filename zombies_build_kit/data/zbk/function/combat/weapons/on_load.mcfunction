# ===================================
# COMBAT WEAPONS SUBMODULE - LOAD
# ===================================
# Purpose: Initialize weapon system, grenade mechanics, and motion tracking
#
# Dependencies: None
# ===================================

# ===== WEAPON CONFIGURATION =====
# Load weapon stats database
function zbk:combat/weapons/management/gun_stats

# Initialize knife damage system
function zbk:combat/weapons/knife/on_load
function zbk:combat/weapons/special_equipment/rocket_shield/on_load

# ===== WEAPON SYSTEM SCOREBOARDS =====
# Grenade tracking
scoreboard objectives add throw_snowball minecraft.used:minecraft.snowball

# Swap Weapon system
scoreboard objectives add active_weapon dummy "Active Weapon Slot"
scoreboard objectives add was_slot_1 dummy
scoreboard objectives add weapon_count dummy "Number of Weapons Owned"

# ===== MOTION SYSTEM (for grenade projectiles) =====
scoreboard objectives add motion_x1 dummy
scoreboard objectives add motion_y1 dummy
scoreboard objectives add motion_z1 dummy
scoreboard objectives add motion_x2 dummy
scoreboard objectives add motion_y2 dummy
scoreboard objectives add motion_z2 dummy
scoreboard objectives add grenade_distance dummy
scoreboard objectives add grenade_id dummy
scoreboard objectives add grenade_sub_step dummy
scoreboard objectives add crawler_id dummy

# ===== PLAYER GUN STATS TRACKING =====
# Core scoreboards
scoreboard objectives add gun_id dummy
scoreboard objectives add grenade_ammo dummy
scoreboard objectives add max_grenade_ammo dummy
scoreboard objectives add special_equipment dummy
scoreboard objectives add special_equipment_ammo dummy
scoreboard objectives add max_special_equipment_ammo dummy
scoreboard objectives add special_equipment_use_lock dummy
scoreboard objectives add stats dummy
scoreboard objectives add damage_calc dummy

# Semi-auto trigger locks (prevents firing while holding)
scoreboard objectives add pistol_trigger_lock dummy
scoreboard objectives add rainbow_rifle_trigger_lock dummy
scoreboard objectives add ray_gun_trigger_lock dummy

# Full-auto firing flag (bridges missed using_item ticks)
scoreboard objectives add auto_firing dummy


# Slot 1 Tracking
scoreboard objectives add gun_1 dummy
scoreboard objectives add shots_1 dummy
scoreboard objectives add fire_1 dummy
scoreboard objectives add ammo_1 dummy
scoreboard objectives add max_ammo_1 dummy
scoreboard objectives add cooldown_1 dummy
scoreboard objectives add reserve_ammo_1 dummy
scoreboard objectives add max_reserve_1 dummy
scoreboard objectives add is_reloading_1 dummy
scoreboard objectives add reload_timer_1 dummy
scoreboard objectives add reload_speed_1 dummy

# Slot 2 Tracking
scoreboard objectives add gun_2 dummy
scoreboard objectives add shots_2 dummy
scoreboard objectives add fire_2 dummy
scoreboard objectives add ammo_2 dummy
scoreboard objectives add max_ammo_2 dummy
scoreboard objectives add cooldown_2 dummy
scoreboard objectives add reserve_ammo_2 dummy
scoreboard objectives add max_reserve_2 dummy
scoreboard objectives add is_reloading_2 dummy
scoreboard objectives add reload_timer_2 dummy
scoreboard objectives add reload_speed_2 dummy

# Slot 3 tracking
scoreboard objectives add gun_3 dummy
scoreboard objectives add shots_3 dummy
scoreboard objectives add fire_3 dummy
scoreboard objectives add ammo_3 dummy
scoreboard objectives add max_ammo_3 dummy
scoreboard objectives add cooldown_3 dummy
scoreboard objectives add reserve_ammo_3 dummy
scoreboard objectives add max_reserve_3 dummy
scoreboard objectives add is_reloading_3 dummy
scoreboard objectives add reload_timer_3 dummy
scoreboard objectives add reload_speed_3 dummy

# Pack-a-Punch tier (0=unpacked, 1=PaP I, 2=PaP II) and elemental effect per slot
# Elements: 0=none, 1=Blast Furnace, 2=Dead Wire, 3=Fireworks, 4=Thunder Wall, 5=Turned
scoreboard objectives add tier_1 dummy
scoreboard objectives add tier_2 dummy
scoreboard objectives add tier_3 dummy
scoreboard objectives add pap_pending_slot dummy
scoreboard objectives add pap_pending_tier dummy
scoreboard objectives add pap_buyer_id dummy
scoreboard objectives add pap_pending_gun_id dummy
scoreboard objectives add element_1 dummy
scoreboard objectives add element_2 dummy
scoreboard objectives add element_3 dummy
scoreboard objectives add turned_expire dummy
scoreboard objectives add bf_cooldown dummy
scoreboard objectives add bf_burn_timer dummy
scoreboard objectives add bf_shooter_id dummy
scoreboard objectives add tw_cooldown dummy
scoreboard objectives add tw_launch_timer dummy
scoreboard objectives add tw_shooter_id dummy
scoreboard objectives add fw_cooldown dummy
scoreboard objectives add fw_kill_timer dummy
scoreboard objectives add fw_shooter_id dummy
scoreboard objectives add dw_cooldown dummy

# Raycast system
scoreboard objectives add raycast_distance dummy
# ===== SET CONSTANTS =====
# Insta-kill stat constant
scoreboard players set #insta_kill stats 1000000

# Division constant for Speed Cola reload speed
scoreboard players set #2 stats 2
scoreboard players set #3 stats 3

# Grenade velocity constants
scoreboard players set #100 stats 100
scoreboard players set #250 stats 250

# ===== WEAPON TRIGGERS (from book) =====
scoreboard objectives add give_pistol trigger
scoreboard objectives add give_rifle trigger
scoreboard objectives add give_shotgun trigger
scoreboard objectives add give_double_barrel trigger
scoreboard objectives add give_sniper trigger
scoreboard objectives add give_lmg trigger
scoreboard objectives add give_flamethrower trigger
scoreboard objectives add give_grenade_launcher trigger
scoreboard objectives add give_rainbow_rifle trigger
scoreboard objectives add give_ray_gun trigger
scoreboard objectives add give_monkey_bomb trigger
scoreboard objectives add give_trip_mine trigger




# BO3 integration
scoreboard objectives add bo3_hold dummy
scoreboard objectives add bo3_press dummy
scoreboard objectives add bo3_budget dummy
scoreboard objectives add bo3_last_slot dummy
scoreboard objectives add bo3_last_gun dummy
scoreboard objectives add bo3_down dummy
scoreboard objectives add bo3_was_down dummy
scoreboard objectives add bo3_delay_1 dummy
scoreboard objectives add bo3_burst_1 dummy
scoreboard objectives add bo3_delay_2 dummy
scoreboard objectives add bo3_burst_2 dummy
scoreboard objectives add bo3_delay_3 dummy
scoreboard objectives add bo3_burst_3 dummy
scoreboard objectives add bo3_delay_4 dummy
scoreboard objectives add bo3_burst_4 dummy
scoreboard objectives add gun_4 dummy
scoreboard objectives add ammo_4 dummy
scoreboard objectives add max_ammo_4 dummy
scoreboard objectives add reserve_ammo_4 dummy
scoreboard objectives add max_reserve_4 dummy
scoreboard objectives add tier_4 dummy
scoreboard objectives add element_4 dummy
scoreboard objectives add is_reloading_4 dummy
scoreboard objectives add reload_timer_4 dummy
scoreboard objectives add give_bo3 trigger

scoreboard objectives add bo3_rocket_age dummy
scoreboard objectives add bo3_rocket_steps dummy
kill @e[type=marker,tag=bo3_rocket]
