# === CALCULATE BURST SIZE ===
# Purpose: Determine how many zombies to spawn per burst based on round number
# CoD Zombies-style progression:
# Round 1-5: 4-6 zombies per burst
# Round 6-10: 6-8 zombies per burst
# Round 11-20: 8-10 zombies per burst
# Round 21+: 10-12 zombies per burst

# Default to highest tier
scoreboard players set #global wave.burst_size 11

# Round 1-5: burst size 5
execute if score #global wave.round matches 1..5 run scoreboard players set #global wave.burst_size 5

# Round 6-10: burst size 7
execute if score #global wave.round matches 6..10 run scoreboard players set #global wave.burst_size 7

# Round 11-20: burst size 9
execute if score #global wave.round matches 11..20 run scoreboard players set #global wave.burst_size 9
