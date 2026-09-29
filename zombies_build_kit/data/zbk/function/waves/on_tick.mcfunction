# The dog marker check uses item contents directly while retaining the original item-processing order.
# Placement and test-spawn animation remain available before active-game wave gates.

# ===================================
# WAVES MODULE - TICK
# ===================================
# Purpose: Per-tick wave system logic
#
# Called from: tick.mcfunction (root orchestrator)
# ===================================

# Detect and setup newly placed spawn markers (always run for building)
function zbk:waves/markers/zombie/place
function zbk:waves/markers/dog/place
function zbk:waves/events/extension/on_tick
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Show spawn marker particles if enabled (always run for building)
execute if score #global wave.show_markers matches 1 run function zbk:waves/markers/show_particles

# Check all dog marker stones for max ammo spawning
execute as @e[type=item] if items entity @s contents *[custom_data~{dog_round_marker:1b}] at @s run function zbk:waves/special_rounds/dog/check_marker

# Animate zombie hole/wall spawn mannequins. This also runs in the lobby for test spawns.
execute as @e[type=mannequin,tag=hole_cleanup_mannequin] at @s run function zbk:waves/spawning/zombie/hole/cleanup_mannequin
execute as @e[type=mannequin,tag=wall_cleanup_mannequin] at @s run function zbk:waves/spawning/zombie/wall/cleanup_mannequin
execute as @e[type=mannequin,tag=hole_zombie] at @s run function zbk:waves/spawning/zombie/hole/tick
execute as @e[type=mannequin,tag=wall_zombie] at @s run function zbk:waves/spawning/zombie/wall/tick

# Only run wave logic when game is active
execute if score #global game_active matches 1 run function zbk:waves/management/tick_active
