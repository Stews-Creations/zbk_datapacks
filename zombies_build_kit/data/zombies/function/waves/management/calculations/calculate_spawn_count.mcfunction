# === CALCULATE SPAWN COUNT ===
# Purpose: Calculate total enemy count for this round
# Formula: Round Number + Spawn Multiplier

# Set spawn count = round number
scoreboard players operation #global wave.spawn_count = #global wave.round

# Add spawn multiplier
scoreboard players operation #global wave.spawn_count *= #global wave.spawn_multiplier
