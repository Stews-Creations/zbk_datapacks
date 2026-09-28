# === SPAWN WAVE ===
# Purpose: Main spawn loop that spawns enemies during active rounds
# Zombies: Burst spawning with 50 concurrent enemy cap
# Dogs: Keep existing 1-per-tick spawning

# Check if we've already spawned all enemies for this round
execute if score #global wave.spawned >= #global wave.spawn_count run scoreboard players set #global wave.is_active 3
execute if score #global wave.spawned >= #global wave.spawn_count run return 0

# Dog rounds: Use original spawn logic (1 per tick, no burst system)
execute if score #global wave.is_dog_round matches 1 run function zbk:waves/spawning/dog/spawn
execute if score #global wave.is_dog_round matches 1 run return 0

# Zombie-only burst state and weighted selection.
function zbk:waves/spawning/zombie/tick
