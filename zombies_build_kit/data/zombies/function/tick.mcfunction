# ===================================
# ZOMBIES BUILD KIT - MAIN TICK LOOP
# ===================================
# Runs every game tick (20x per second)
# This file orchestrates all module tick functions

# ===== GLOBAL TICK =====
# Handle global tick counter and cross-cutting concerns
function zombies:global/on_tick

# ===== MODULE TICK FUNCTIONS =====
# Call all module tick functions (order matters for dependencies)
function zombies:player/on_tick
function zombies:combat/on_tick
function zombies:behavior/on_tick
function zombies:waves/on_tick
function zombies:bosses/on_tick
function zombies:map_elements/on_tick
function zombies:build_kit/on_tick
function zombies:game/on_tick

# ===== SINGLE @a LOOP =====
# Routine per-player hooks share this loop; feature-local loops retain their required phase order
execute as @a at @s run function zombies:on_tick_as_player

execute if score #ready zbk.api matches 1 run function zbk:dispatch/tick
execute as @e[tag=wave_enemy,tag=!zbk.kill_reported,nbt={Health:0.0f}] at @s run function zbk:enemy/native_death
