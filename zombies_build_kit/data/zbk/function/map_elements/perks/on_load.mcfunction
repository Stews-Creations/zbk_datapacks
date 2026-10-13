# ===================================
# PERKS SUBMODULE - LOAD
# ===================================
# Purpose: Initialize perk system scoreboards and triggers
#
# Dependencies: None
#
# Scoreboards Created:
# - perk_jugg, perk_speed, perk_doubletap, perk_stamina, perk_revive, perk_mule
# - perk_deadshot, perk_cherry, perk_widows
# - perk_order, perk_count
#
# Triggers Created:
# - All perk-related triggers (clear, grant, spawn eggs)
# ===================================

# ===== PERK SCOREBOARDS =====
# Track which perks each player has active
scoreboard objectives add perk_jugg dummy "Juggernog"
scoreboard objectives add perk_speed dummy "Speed Cola"
scoreboard objectives add perk_doubletap dummy "Double Tap"
scoreboard objectives add perk_stamina dummy "Stamina Up"
scoreboard objectives add perk_revive dummy "Quick Revive"
scoreboard objectives add perk_mule dummy "Mule Kick"
scoreboard objectives add perk_deadshot dummy "Deadshot Daiquiri"
scoreboard objectives add perk_cherry dummy "Electric Cherry"
scoreboard objectives add perk_widows dummy "Widow's Wine"

# Track acquisition order for the perk HUD and Mule Kick
scoreboard objectives add perk_order dummy "Perk Order Counter"

# Track total perks purchased per player (max 4)
scoreboard objectives add perk_count dummy "Perk Count"

# Track Quick Revive purchases in solo mode (max 3)
scoreboard objectives add revive_buys dummy "Quick Revive Solo Buys"

# Electric Cherry temporary glow ownership.
scoreboard objectives add cherry_stun dummy
team add cherry_stun
team modify cherry_stun color blue

# Widow web, pickup and sticky grenade lifetimes.
scoreboard objectives add ww_timer dummy
scoreboard objectives add ww_strength dummy
scoreboard objectives add ww_fuse dummy
scoreboard objectives add ww_owner dummy

# Reset generations persist across reloads, including entities in unloaded chunks.
scoreboard objectives add perk_epoch dummy
scoreboard objectives add pm_bonus_epoch dummy

# Initialize default values
function zbk:map_elements/perks/initialize

# ===== PERK TRIGGERS =====
# (objectives registered here; enables are done per-player in map_elements/perks/initialize)
scoreboard objectives add clear_perks trigger
scoreboard objectives add reset_bonus trigger

# Juggernog triggers
scoreboard objectives add give_juggernog trigger
scoreboard objectives add give_juggernog_egg trigger

# Stamina Up triggers
scoreboard objectives add give_stamina trigger
scoreboard objectives add give_stamina_egg trigger

# Speed Cola triggers
scoreboard objectives add give_speed trigger
scoreboard objectives add give_speed_egg trigger

# Double Tap triggers
scoreboard objectives add give_double trigger
scoreboard objectives add give_double_egg trigger

# Quick Revive triggers
scoreboard objectives add give_revive trigger
scoreboard objectives add give_revive_egg trigger

# Mule Kick triggers
scoreboard objectives add give_mule trigger
scoreboard objectives add give_mule_egg trigger

# Der Wunderfizz triggers
scoreboard objectives add give_wunderfizz_egg trigger

# Deadshot Daiquiri, Widow's Wine, and Electric Cherry cabinet placement
scoreboard objectives add give_deadshot_egg trigger
scoreboard objectives add give_widows_wine_egg trigger
scoreboard objectives add give_electric_cherry_egg trigger

# Wunderfizz scoreboards
scoreboard objectives add wunderfizz_timer dummy "Wunderfizz Cycle Timer"
scoreboard objectives add wunderfizz_perk dummy "Wunderfizz Current Perk"
scoreboard objectives add wunderfizz_uses dummy "Wunderfizz Use Counter"
scoreboard objectives add wunderfizz_id dummy "Wunderfizz Location ID"
scoreboard objectives add wunderfizz_ready dummy "Wunderfizz Ready State"

scoreboard objectives add pm_v2_id dummy
scoreboard objectives add pm_v2_select dummy

# Additional perk acquisition triggers.
scoreboard objectives add give_deadshot trigger
scoreboard objectives add give_cherry trigger
scoreboard objectives add give_widows trigger
