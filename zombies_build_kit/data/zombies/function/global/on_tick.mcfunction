# Shared timing is advanced once per root tick; feature loops must consume it without advancing it per entity.

# ===================================
# GLOBAL MODULE - TICK
# ===================================
# Runs every game tick for global systems

# Global tick counter (0-99 loop)
scoreboard players add #tick tick 1
execute if score #tick tick matches 100 run scoreboard players set #tick tick 0

function zbk:dispatch/voice_on_tick
