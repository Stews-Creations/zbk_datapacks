# === CALCULATE SPAWN MULTIPLIER ===
# Purpose: Increase spawn multiplier every 5 rounds
# Multiplier increases by 1 every 5 rounds

# Increment mod counter
scoreboard players add #global wave.spawn_multiplier_mod 1

# Check if we've reached 5 rounds
execute if score #global wave.spawn_multiplier_mod matches 5.. run scoreboard players add #global wave.spawn_multiplier 1
execute if score #global wave.spawn_multiplier_mod matches 5.. run scoreboard players set #global wave.spawn_multiplier_mod 0
