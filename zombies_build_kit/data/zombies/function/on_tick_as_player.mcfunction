# ===================================
# ZOMBIES BUILD KIT - TICK AS PLAYER
# ===================================
# Runs every game tick for each player (called from execute as @a at @s in main tick)
# Shared per-player lifecycle; feature-local loops may run earlier when phase ordering requires it

# Call all module per-player tick functions
function zombies:global/on_tick_as_player
function zombies:player/on_tick_as_player
function zombies:combat/on_tick_as_player
function zombies:bosses/on_tick_as_player
function zombies:behavior/on_tick_as_player
function zombies:waves/on_tick_as_player
function zombies:map_elements/on_tick_as_player
function zombies:build_kit/on_tick_as_player
function zombies:game/on_tick_as_player

execute if score #ready zbk.api matches 1 run function zbk:dispatch/player_tick
