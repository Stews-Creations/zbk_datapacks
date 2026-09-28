# Reusable placed systems own their marker passes; map-exclusive dispatch belongs in maps.

# ===================================
# MAP ELEMENTS MODULE - TICK
# ===================================
# Purpose: Execute per-tick logic for all map element systems
#
# Dependencies: map_elements/on_load.mcfunction
# ===================================

# ===== SUBMODULE TICK FUNCTIONS =====
function zombies:map_elements/perks/on_tick
function zombies:map_elements/mystery_box/on_tick
function zombies:map_elements/power/on_tick
function zombies:map_elements/door/on_tick
function zombies:map_elements/traps/on_tick
function zombies:map_elements/jump_pad/on_tick
function zombies:map_elements/teleporter/on_tick
function zombies:map_elements/fire_floor/on_tick
function zombies:map_elements/barrier/on_tick
function zombies:map_elements/barrier_w3/on_tick
function zombies:map_elements/wall_gun/on_tick
function zombies:map_elements/pack_a_punch/on_tick
function zombies:map_elements/custom_door/on_tick
function zombies:map_elements/explosive_barrel/on_tick
function zombies:map_elements/blocks/on_tick
function zombies:map_elements/game_signals/on_tick
function zombies:map_elements/radio/on_tick
function zombies:map_elements/cutscenes/on_tick
function zombies:map_elements/spawn_menu_v2/on_tick

# ===== MAP DECORATIONS =====
# Floating objects (trucks/cars)
function zombies:map_elements/floating_objects/on_tick
function zombies:map_elements/rocket_shield/on_tick
function zombies:map_elements/crafting_bench/on_tick
