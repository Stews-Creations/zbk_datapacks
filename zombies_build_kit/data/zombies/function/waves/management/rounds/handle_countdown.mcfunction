# === HANDLE COUNTDOWN ===
# Purpose: Count down before enemies spawn (5 seconds)
# When countdown reaches 0, start spawning

# Decrement countdown
scoreboard players remove #global wave.countdown 1

# Check if countdown is complete
execute if score #global wave.countdown matches ..0 run function zombies:waves/management/rounds/start_spawning
