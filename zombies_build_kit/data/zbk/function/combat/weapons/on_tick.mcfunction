# Keep input, cooldown, projectile, and equipment phases in their existing order.
# Only independent work for one monkey marker is grouped; decoy synchronization follows its movement.

execute as @a at @s run function zbk:combat/weapons/guns/bo3/input/tick
# ===================================
# COMBAT WEAPONS SUBMODULE - TICK
# ===================================
# Purpose: Execute per-tick logic for weapon cooldowns and grenade system
#
# Dependencies: combat/weapons/on_load.mcfunction
# ===================================

# ===== WEAPON TIMERS =====
# Run weapon cooldowns and burst firing for all slots
function zbk:combat/weapons/timers

# ===== FULL-AUTO FIRING =====
# Bridges missed using_item ticks for full-auto weapons
function zbk:combat/weapons/full_auto_firing

# ===== ADVANCEMENT RECOVERY =====
# Defensive fix for stuck advancement states
function zbk:combat/weapons/advancement_recovery

# Release lock prevents duplicate fire dispatch from overlapping input paths.
function zbk:dispatch/extension/combat/weapons/on_tick/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# ===== RELOAD SYSTEM =====
# Detect and trigger auto-reload when magazines are empty
function zbk:combat/weapons/management/detect_reload

# Detect manual reload (sneak tap)
function zbk:combat/weapons/management/detect_manual_reload

# ===== SPECIAL EQUIPMENT SYSTEM =====
# Dropped shields are displays, never transferable equipment.
execute as @e[type=item] if items entity @s contents minecraft:shield[custom_data~{rocket_shield_prototype:true}] run kill @s
# Detect Q drops and convert them into temporary special equipment displays.
scoreboard players remove @a[scores={special_equipment_use_lock=1..}] special_equipment_use_lock 1
function zbk:combat/weapons/special_equipment/detect_drop
execute as @e[type=marker,tag=monkey_bomb_marker] at @s run function zbk:combat/weapons/special_equipment/monkey_bomb/tick_marker

execute as @e[type=item_display,tag=monkey_bomb_display] at @s run function zbk:combat/weapons/special_equipment/monkey_bomb/tick_display
execute as @e[type=marker,tag=trip_mine_marker] at @s run function zbk:combat/weapons/special_equipment/trip_mine/tick_mine

# ===== GRENADE SYSTEM =====
# Instantly clear dropped knives from players with no grenade ammo (BEFORE detection)
execute as @a[scores={grenade_ammo=0}] at @s as @e[type=item,distance=..3] if items entity @s contents *[custom_data~{knife:true}] run kill @s

# Detect Q key drops and convert to grenade throw
function zbk:player/throw_grenade/detect

# Clean up any remaining dropped knives that weren't processed for grenade throws (after detection runs)
execute as @e[type=item,tag=!grenade_drop] if items entity @s contents *[custom_data~{knife:true}] run kill @s

# Update active grenade positions each tick (marker-based system with gravity)
execute as @e[type=marker,tag=grenade_marker,tag=active_grenade,tag=!exploded] at @s run function zbk:combat/weapons/grenade/physics/update_position

execute as @e[type=marker,tag=bo3_rocket] at @s run function zbk:combat/weapons/guns/bo3/projectile/tick
