# Context: current player during join or reset. Some helpers also update shared objective presentation.
# Keep this player initialization separate from resetting the whole game.

function zbk:combat/weapons/guns/bo3/migration/before_setup
# ===================================
# PLAYER SETUP - SETUP PLAYER
# ===================================
# Purpose: Initialize all per-player scoreboard values and triggers for @s.
# Called from:
#   - player/setup/setup_uuid (new players / late joiners)
#   - player/initialize via execute as @a (game reset)
# Sets up one player; shared sidebar formatting and migration scratch are also configured.
# ===================================

# ===== PLAYER POINTS =====
scoreboard players set @s player_points 500
function zbk:player/setup/setup_scoreboard_format
scoreboard objectives setdisplay sidebar player_points

# ===== PLAYER TRIGGERS =====
scoreboard players enable @s reset_points
scoreboard players enable @s give_points
scoreboard players enable @s give_10k_points
scoreboard players enable @s show_stats
scoreboard players enable @s reset_game
scoreboard players enable @s tp_worldspawn
scoreboard players enable @s delete_trap

# Game triggers (can't call game/enable_triggers -- would be recursive)
scoreboard players enable @s give_spawn_point
scoreboard players enable @s give_worldspawn
scoreboard players enable @s give_spawn_menu
scoreboard players enable @s give_spawn_menu_v2
scoreboard players enable @s start_game
scoreboard players enable @s start_no_cutscene
scoreboard players enable @s stop_no_cutscene

# ===== OTHER PLAYER DEFAULTS =====
scoreboard players set @s barrier_repair_cooldown 0

# ===== DOWN SYSTEM RESET =====
function zbk:player/down_system/reset

# ===== PER-PLAYER STATE RESET =====
# These modules have per-player state that needs resetting for @s
function zbk:combat/weapons/initialize
function zbk:build_kit/initialize

# ===== MODULE TRIGGER ENABLES =====
# Each module owns its own enable_triggers.mcfunction
function zbk:combat/weapons/enable_triggers
function zbk:combat/powerups/enable_triggers
function zbk:map_elements/enable_triggers
function zbk:build_kit/enable_triggers
function zbk:waves/enable_triggers
function zbk:behavior/enable_triggers

# ===== STAMP DATAPACK VERSION =====
# Mark this player as setup for the current reload version
scoreboard players operation @s dp_version = #dp_version dp_version

execute if entity @s[tag=bo3_migrate_setup] run function zbk:combat/weapons/guns/bo3/migration/after_setup with storage zbk:bo3 saved_inventory
function zbk:player/inventory/migration/remove_hud_items

function zbk:player/inventory/equipment/clear_reload_bar
function zbk:player/actionbar/reload/clear
