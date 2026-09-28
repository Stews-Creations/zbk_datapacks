# ===================================
# MYSTERY BOX SUBMODULE - LOAD
# ===================================
# Purpose: Initialize mystery box system scoreboards and triggers
#
# Dependencies: None
#
# Scoreboards Created:
# - mystery_box_spin_timer, mystery_box_location_id, mystery_box_active
# - mystery_box_spawn_location, mystery_box_unlocked, mystery_box
# - mystery_box_last_anim, mystery_box_ready, mystery_box_can_claim
# - mystery_box_selected_gun, mystery_box_spins, mystery_box_player_id
# - mystery_box_frame, mystery_box_pending_empty
#
# Triggers Created:
# - give_mystery_box_egg, reset_mystery_box_ids, tag_spawn_location
# ===================================

# ===== MYSTERY BOX SYSTEM =====
# Scoreboard for gun spin timing
scoreboard objectives add mystery_box_spin_timer dummy

# Mystery Box Location Management (separate from player IDs)
scoreboard objectives add mystery_box_location_id dummy
scoreboard objectives add mystery_box_active dummy
scoreboard objectives add mystery_box_spawn_location dummy
scoreboard objectives add mystery_box_unlocked dummy

# Mystery Box animation effects timer
scoreboard objectives add mystery_box dummy

# Mystery Box animation state tracking
scoreboard objectives add mystery_box_last_anim dummy
scoreboard objectives add mystery_box_ready dummy
scoreboard objectives add mystery_box_can_claim dummy
scoreboard objectives add mystery_box_selected_gun dummy
scoreboard objectives add mystery_box_spins dummy
scoreboard objectives add mystery_box_player_id dummy
scoreboard objectives add mystery_box_frame dummy
scoreboard objectives add mystery_box_pending_empty dummy
scoreboard objectives add mystery_box_pending_spawn dummy

# Initialize global counters
scoreboard players set #current_location mystery_box_location_id 0
scoreboard players set #previous_location mystery_box_location_id 0
scoreboard players set #total_locations mystery_box_location_id 0
scoreboard players set #total_spawn_locations mystery_box_location_id 0
scoreboard players set #mystery_box_unlocked mystery_box_unlocked 0

# Reset all mystery box text displays to normal price on reload
execute as @e[tag=mystery_box_10,type=text_display] run data merge entity @s {text:[{"text":"Buy: 950","color":"#FFAA00","bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":"minecraft:uniform"}]}

# Initialize default values
function zombies:map_elements/mystery_box/initialize

# Mystery Box triggers
# (enables are done per-player in map_elements/mystery_box/initialize)
scoreboard objectives add give_mystery_box_egg trigger
scoreboard objectives add reset_mystery_box_ids trigger
scoreboard objectives add tag_spawn_location trigger
