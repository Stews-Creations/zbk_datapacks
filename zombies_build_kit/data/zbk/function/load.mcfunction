# Define shared objectives before loading consumers.
# Schedules and game reset remain explicit so reload follows the same owned cleanup paths.

# ===================================
# ZOMBIES BUILD KIT - LOAD FUNCTION
# ===================================
# Runs once when the datapack is loaded/reloaded
# This file orchestrates all module load functions

# ===== STARTUP MESSAGE =====
execute as @a run function zbk:load_message

# ===== GLOBAL INITIALIZATION =====
# Initialize global systems first (gamerules, scoreboards, teams)
function zbk:on_load
function zbk:global/on_load

# ===== MODULE LOAD FUNCTIONS =====
# Call all module load functions to initialize scoreboards and systems
function zbk:game/on_load
function zbk:player/on_load
function zbk:sounds/voice/on_load
function zbk:combat/on_load
function zbk:behavior/on_load
function zbk:waves/on_load
function zbk:bosses/on_load
function zbk:map_elements/on_load
function zbk:build_kit/on_load

# Clear any video/cutscene that was active before /reload.
function zbk:map_elements/cutscenes/management/stop_active

# ===== SCHEDULED FUNCTIONS =====
schedule function zbk:global/tick_1s 20t

# ===== INITIALIZE ALL GAME SYSTEMS =====
# Initialize all systems to default state
stopsound @a
function zbk:game/initialize
function zbk:map_elements/blocks/management/reload

# ===== WORLD SPAWN FUNCTIONS =====
schedule function zbk:scheduled_tp 10t
