# ===================================
# PLAYER MODULE - LOAD
# ===================================
# Purpose: Initialize player tracking, health, inventory, and down system
#
# Dependencies: global/on_load.mcfunction (id, tick, no_friendly_fire_team)
# ===================================

# ===== PLAYER TRACKING SCOREBOARDS =====
# Player rotation for spawn egg placement
scoreboard objectives add playerYaw dummy "Player Yaw"

# ===== HEALTH & DOWN SYSTEM SCOREBOARDS =====
# Health tracking
scoreboard objectives add health health

# Revive progress timer
scoreboard objectives add revive_timer dummy

# Bleedout timers
scoreboard objectives add downed_timer dummy
scoreboard objectives add downed_timer_seconds dummy
scoreboard players set #tick downed_timer 20

# Setup team(s)
team add downed
team modify downed friendlyFire false
team modify downed seeFriendlyInvisibles false
team modify downed collisionRule never

# ===== PLAYER POINTS =====
# Compact sidebar; modify also updates an objective already present on reload.
scoreboard objectives add player_points dummy {text:"Points",color:"#C9AA65",bold:false}
scoreboard objectives modify player_points displayname {text:"Points",color:"#C9AA65",bold:false}
scoreboard objectives setdisplay sidebar player_points
scoreboard objectives modify player_points numberformat styled {color:"#C9AA65"}

# ===== PLAYER POINT TRIGGERS =====
scoreboard objectives add reset_points trigger
scoreboard objectives add give_points trigger
scoreboard objectives add give_10k_points trigger

# Per-player presentation preference: 1 = gun left, 2 = gun right.
# Deliberately retained through player setup, death, and game reset.
scoreboard objectives add gun_side dummy
scoreboard objectives add set_gun_side trigger


# ===== DATAPACK VERSION TRACKING =====
# Tracks reload count so returning players get re-setup
scoreboard objectives add dp_version dummy
# Ensure #dp_version exists before first increment
execute unless score #dp_version dp_version matches 0.. run scoreboard players set #dp_version dp_version 0
scoreboard players add #dp_version dp_version 1

# ===== PLAYER STATS =====
function zbk:player/stats/on_load

# Reload progress on the ammo-panel underline; combat owns the timers.
scoreboard objectives add rb_prev dummy
scoreboard objectives add rb_total dummy
scoreboard objectives add rb_slot dummy
scoreboard objectives add rb_gun dummy
scoreboard objectives add rb_ammo dummy
scoreboard objectives add rb_flash dummy
scoreboard objectives add rb_step dummy
scoreboard players set #rb_scale temp 42
data modify storage zbk:hud reload_frames set value ["\ue100", "\ue101", "\ue102", "\ue103", "\ue104", "\ue105", "\ue106", "\ue107", "\ue108", "\ue109", "\ue10a", "\ue10b", "\ue10c", "\ue10d", "\ue10e", "\ue10f", "\ue110", "\ue111", "\ue112", "\ue113", "\ue114", "\ue115", "\ue116", "\ue117", "\ue118", "\ue119", "\ue11a", "\ue11b", "\ue11c", "\ue11d", "\ue11e", "\ue11f", "\ue120", "\ue121", "\ue122", "\ue123", "\ue124", "\ue125", "\ue126", "\ue127", "\ue128", "\ue129", "\ue12a", "\ue12b"]

# ===== INITIALIZE =====
# Set player system to default values
function zbk:player/initialize
