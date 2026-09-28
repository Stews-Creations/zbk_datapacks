# === CALCULATE HEALTH ===
# Purpose: Calculate zombie health for this round
# Formula: Round Number + 20

# Set health = round number
scoreboard players operation #global wave.health = #global wave.round

# Add base health (20)
scoreboard players operation #global wave.health += #global wave.health_base
