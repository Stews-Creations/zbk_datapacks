# Maintenance uses 20 ticks (1 second); gameplay timers and input remain on their original hooks.
# Each maintenance consumer rechecks loaded state, so unloaded markers are handled on a later pass.

# ===================================
# GLOBAL - TICK 1S (Every 20 ticks)
# ===================================
# Scheduled function for tasks that don't need to run every tick.
# Re-schedules itself at the end.

# ===== CRAWLER ORPHAN CHECK =====
function zombies:behavior/crawler/tick_1s

function zombies:behavior/relocation/zombie/tick

# ===== DROPPED ITEM CLEANUP =====
function zombies:player/inventory/tick_1s

# ===== AMBIENT MUSIC =====

# Saved markers and inactive quest presentation need reconciliation, not frame-rate polling.
execute as @e[type=marker,tag=wall_gun] run function zombies:map_elements/wall_gun/marker/maintenance
function zombies:map_elements/rocket_shield/management/maintenance
function zombies:map_elements/crafting_bench/management/maintenance


# Shared display policy checks previously unseen assemblies, including newly loaded chunks.
function zombies:global/rendering/maintenance

# ===== RE-SCHEDULE =====
schedule function zombies:global/tick_1s 20t

execute if score #ready zbk.api matches 1 run function zbk:dispatch/maintenance
