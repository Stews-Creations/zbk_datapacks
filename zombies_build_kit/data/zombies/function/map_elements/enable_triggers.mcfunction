# ===================================
# MAP ELEMENTS - ENABLE TRIGGERS
# ===================================
# Purpose: Enable all map element triggers for @s.
# Called from: player/setup/setup_player (per-player)
# ===================================

# Top-level map element trigger
scoreboard players enable @s give_mob_blocker

# ===== SUBMODULE TRIGGER ENABLES =====
function zombies:map_elements/perks/enable_triggers
function zombies:map_elements/door/enable_triggers
function zombies:map_elements/traps/enable_triggers
function zombies:map_elements/power/enable_triggers
function zombies:map_elements/mystery_box/enable_triggers
function zombies:map_elements/fire_floor/enable_triggers
function zombies:map_elements/wall_gun/enable_triggers
function zombies:map_elements/pack_a_punch/enable_triggers
function zombies:map_elements/barrier/enable_triggers
function zombies:map_elements/barrier_w3/enable_triggers
function zombies:map_elements/custom_door/enable_triggers
function zombies:map_elements/explosive_barrel/enable_triggers
function zombies:map_elements/blocks/enable_triggers
function zombies:map_elements/game_signals/enable_triggers
function zombies:map_elements/radio/enable_triggers
function zombies:map_elements/teleporter/enable_triggers
function zombies:map_elements/painting/enable_triggers
