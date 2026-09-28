# ===================================
# COMBAT POWERUPS SUBMODULE - LOAD
# ===================================
# Purpose: Initialize powerup system (Insta Kill, Double Points, Fire Sale, Max Ammo, Nuke)
#
# Dependencies: None
# ===================================

# ===== POWERUP SCOREBOARDS =====
scoreboard objectives add insta_kill dummy
scoreboard objectives add fire_sale dummy
scoreboard objectives add double_points dummy

# Track powerup order (for inventory display in slots 2-4)
scoreboard objectives add powerup_order dummy "Powerup Order Counter"

# ===== DROP GATING SCOREBOARDS =====
# Kill gate: powerups only drop when enough kills have been reached
scoreboard objectives add drop_req_kills dummy "Drop Required Kills"
scoreboard objectives add drop_round_drops dummy "Drop Round Count"

# ===== POWERUP TRIGGERS (from dialogs) =====
scoreboard objectives add activate_insta_kill trigger
scoreboard objectives add activate_double_points trigger
scoreboard objectives add activate_fire_sale trigger
scoreboard objectives add activate_max_ammo trigger
scoreboard objectives add activate_nuke trigger
scoreboard objectives add activate_carpenter trigger
scoreboard objectives add activate_death_machine trigger

# Death Machine per-player state
scoreboard objectives add dm_fire_cooldown dummy
scoreboard objectives add dm_timer dummy
scoreboard objectives add dm_sound_cooldown dummy
scoreboard objectives add dm_firing dummy
scoreboard objectives add dm_sound_alt dummy

# ===== INITIALIZE =====
# Set powerup system to default values
function zbk:combat/powerups/initialize
