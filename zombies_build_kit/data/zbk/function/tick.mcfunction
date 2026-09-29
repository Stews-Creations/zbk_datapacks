# ===================================
# ZOMBIES BUILD KIT - MAIN TICK LOOP
# ===================================
# Runs every game tick (20x per second)
# This file orchestrates all module tick functions

# ===== GLOBAL TICK =====
# Handle global tick counter and cross-cutting concerns
function zbk:global/on_tick

# ===== MODULE TICK FUNCTIONS =====
# Call all module tick functions (order matters for dependencies)
function zbk:player/on_tick
function zbk:combat/on_tick
function zbk:behavior/on_tick
function zbk:waves/on_tick
function zbk:bosses/on_tick
function zbk:map_elements/on_tick
function zbk:build_kit/on_tick
function zbk:game/on_tick

# ===== SINGLE @a LOOP =====
# Routine per-player hooks share this loop; feature-local loops retain their required phase order
execute as @a at @s run function zbk:on_tick_as_player

execute if score #ready zbk.lifecycle matches 1 run function zbk:global/events/tick
execute as @e[tag=wave_enemy,tag=!zbk.kill_reported,nbt={Health:0.0f}] at @s run function zbk:combat/enemies/lifecycle/native_death
