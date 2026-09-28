# === WAVES ACTIVE TICK ===
# Purpose: Wave system logic that only runs when game is active
# Called from on_tick.mcfunction when game_active = 1.

# Handle round countdown
execute if score #global wave.is_active matches 1 run function zombies:waves/management/rounds/handle_countdown

# Spawn enemies during active rounds (state 2 = spawning)
execute if score #global wave.is_active matches 2 run function zombies:waves/spawning/spawn_wave

# Check if round is complete (state 3 = all spawned, waiting for kills)
execute if score #global wave.is_active matches 3 run function zombies:waves/management/rounds/check_round_complete
