# ===================================
# MAP ELEMENTS MODULE - LOAD
# ===================================
# Purpose: Initialize all map element systems
#
# Dependencies: None
#
# Submodules Initialized:
# - perks/ (Juggernog, Speed Cola, Double Tap, etc.)
# - mystery_box/ (Mystery Box spawn and animation system)
# - power/ (Power switch system)
# - doors/ (Door purchase system)
# - traps/ (Electric trap system)
# ===================================

# ===== SUBMODULE INITIALIZATION =====
function zbk:map_elements/perks/on_load
function zbk:map_elements/mystery_box/on_load
function zbk:map_elements/power/on_load
function zbk:map_elements/door/on_load
function zbk:map_elements/traps/on_load
function zbk:map_elements/jump_pad/on_load
function zbk:map_elements/teleporter/on_load
function zbk:map_elements/fire_floor/on_load
function zbk:map_elements/barrier/on_load
function zbk:map_elements/barrier_w3/on_load
function zbk:map_elements/wall_gun/on_load
function zbk:map_elements/pack_a_punch/on_load
function zbk:map_elements/custom_door/on_load
function zbk:map_elements/explosive_barrel/on_load
function zbk:map_elements/blocks/on_load
function zbk:map_elements/game_signals/on_load
function zbk:map_elements/radio/on_load
function zbk:map_elements/cutscenes/on_load
function zbk:map_elements/painting/on_load
function zbk:map_elements/spawn_menu_v2/on_load

# ===== BLOCKS =====
# (enable is done per-player in map_elements/initialize)
scoreboard objectives add give_mob_blocker trigger
function zbk:map_elements/rocket_shield/on_load
function zbk:map_elements/crafting_bench/on_load
