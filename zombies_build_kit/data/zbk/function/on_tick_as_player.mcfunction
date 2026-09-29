# ===================================
# ZOMBIES BUILD KIT - TICK AS PLAYER
# ===================================
# Runs every game tick for each player (called from execute as @a at @s in main tick)
# Shared per-player lifecycle; feature-local loops may run earlier when phase ordering requires it

# Call all module per-player tick functions
function zbk:global/on_tick_as_player
function zbk:player/on_tick_as_player
function zbk:combat/on_tick_as_player
function zbk:bosses/on_tick_as_player
function zbk:behavior/on_tick_as_player
function zbk:waves/on_tick_as_player
function zbk:map_elements/on_tick_as_player
function zbk:build_kit/on_tick_as_player
function zbk:game/on_tick_as_player

execute if score #ready zbk.lifecycle matches 1 run function zbk:player/events/player_tick
