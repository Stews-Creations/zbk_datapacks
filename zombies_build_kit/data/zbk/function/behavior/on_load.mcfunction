# Clear optional batch scratch before any enemy hook can observe a previous session.

# ===================================
# BEHAVIOR MODULE - LOAD
# ===================================
# Initializes AI behavior scoreboards

# Batch availability is never valid across reload or world startup.
scoreboard players reset #monkey_available temp

# ===== BARRIER TRIGGERS =====
scoreboard objectives add give_light_level_5 trigger
scoreboard objectives add give_light_level_6 trigger
scoreboard objectives add give_zombie_block_marker trigger
scoreboard objectives add give_player_block_marker trigger

# ===== ENEMY RELOCATION =====
scoreboard objectives add relocation_timer dummy
scoreboard objectives add relocation_zone dummy
scoreboard objectives add relocation_health dummy
function zbk:behavior/relocation/zombie/load
