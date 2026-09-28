# === CALCULATE SPAWN DELAY ===
# Purpose: Determine delay (in ticks) between bursts based on round number
# Progression with decreasing delays:
# Round 1-5: 250 ticks (12.5 seconds)
# Round 6-10: 200 ticks (10 seconds)
# Round 11-20: 150 ticks (7.5 seconds)
# Round 21+: 100 ticks (5 seconds)

# Default to fastest delay
scoreboard players set #global wave.spawn_delay 100

# Round 1-5: 250 tick delay
execute if score #global wave.round matches 1..5 run scoreboard players set #global wave.spawn_delay 250

# Round 6-10: 200 tick delay
execute if score #global wave.round matches 6..10 run scoreboard players set #global wave.spawn_delay 200

# Round 11-20: 150 tick delay
execute if score #global wave.round matches 11..20 run scoreboard players set #global wave.spawn_delay 150
