# ===================================
# GLOBAL MODULE - LOAD
# ===================================
# Purpose: Initialize global systems used across all modules
#
# Dependencies: None
#
# Scoreboards Created:
# - id (player unique IDs)
# - tick (global tick counter)
# - game_active (game state)
# - timer (shared timer)
# - temp (temporary storage)
#
# Teams Created:
# - no_friendly_fire_team
# - spawner_mannequins
# ===================================

# Gamerules
gamerule command_block_output false
gamerule fire_spread_radius_around_player 0
gamerule spawn_mobs false
gamerule mob_griefing false
gamerule locator_bar false
difficulty hard

# Global scoreboards
scoreboard objectives add id dummy
scoreboard objectives add tick dummy
scoreboard objectives add game_active dummy
scoreboard objectives add timer dummy
scoreboard objectives add temp dummy
scoreboard objectives add temp2 dummy
scoreboard objectives add global dummy

# Game mode tracking (1=solo, 2=co-op)
scoreboard objectives add game_mode dummy

# Constants
scoreboard players set #2 temp 2

# Shared team
team add no_friendly_fire_team
team modify no_friendly_fire_team friendlyFire false
team modify no_friendly_fire_team seeFriendlyInvisibles false
team modify no_friendly_fire_team collisionRule never

team add spawner_mannequins
team modify spawner_mannequins collisionRule never

# Reconcile loaded displays once on reload; subsequent passes only inspect new entities.
function zbk:global/rendering/refresh
