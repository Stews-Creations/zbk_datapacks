# Define shared objectives before loading consumers.
# Schedules and game reset remain explicit so reload follows the same owned cleanup paths.

# ===================================
# ZOMBIES BUILD KIT - LOAD FUNCTION
# ===================================
# Runs once when the datapack is loaded/reloaded
# This file orchestrates all module load functions

# ===== STARTUP MESSAGE =====
execute as @a run function zombies:load_message

# ===== GLOBAL INITIALIZATION =====
# Initialize global systems first (gamerules, scoreboards, teams)
function zbk:on_load
function zombies:global/on_load

# ===== MODULE LOAD FUNCTIONS =====
# Call all module load functions to initialize scoreboards and systems
function zombies:game/on_load
function zombies:player/on_load
function zombies:sounds/voice/on_load
function zombies:combat/on_load
function zombies:behavior/on_load
function zombies:waves/on_load
function zombies:bosses/on_load
function zombies:map_elements/on_load
function zombies:build_kit/on_load

# Clear any video/cutscene that was active before /reload.
function zombies:map_elements/cutscenes/management/stop_active

# ===== SCHEDULED FUNCTIONS =====
schedule function zombies:global/tick_1s 20t

# ===== INITIALIZE ALL GAME SYSTEMS =====
# Initialize all systems to default state
stopsound @a
function zbk:game/initialize
function zombies:map_elements/blocks/management/reload

# ===== WORLD SPAWN FUNCTIONS =====
schedule function zombies:scheduled_tp 10t
