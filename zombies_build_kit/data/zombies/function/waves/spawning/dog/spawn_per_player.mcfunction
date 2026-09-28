# === SPAWN DOG PER PLAYER ===
# Purpose: Spawn one dog near the executing player
# Picks randomly from local unlocked spawners (at least 3 blocks away)
# Prefers dog spawners, falling back to zombie spawners so disconnected areas do not softlock.
# Context: @s = player, at @s = player position

# Check if we still have dogs to spawn (compare spawned vs spawn_count)
execute if score #global wave.spawned >= #global wave.spawn_count run return 0

# Tag local unlocked dog spawners first.
tag @e[type=marker,tag=spawn_candidate] remove spawn_candidate
tag @e[type=marker,tag=dog_spawner,distance=3..40,scores={spawner_unlocked=1},sort=nearest,limit=3] add spawn_candidate

# If there are no local dog spawners, use local zombie spawners as fallback dog entry points.
execute unless entity @e[type=marker,tag=spawn_candidate,limit=1] run tag @e[type=marker,tag=zombie_spawner,distance=3..40,scores={spawner_unlocked=1},sort=nearest,limit=3] add spawn_candidate

# Pick 1 randomly from the candidates
tag @e[type=marker,tag=spawn_candidate,sort=random,limit=1] add spawn_selected

# Clear candidate tags
tag @e[type=marker,tag=spawn_candidate] remove spawn_candidate

# Spawn the dog at that marker (this increments wave.spawned automatically)
execute as @e[type=marker,tag=spawn_selected] at @s run function zombies:waves/spawning/dog/summon

# Clear selection tag
tag @e[type=marker,tag=spawn_selected] remove spawn_selected
