# === SPAWN DOG ===
# Purpose: Spawn dogs (wolves) - one per active player simultaneously
# Spawns near active players from local dog spawners, falling back to local zombie spawners
# Uses 60-tick delay between spawn cycles (3 seconds)

# Handle spawn delay timer - if timer is active, count down and skip spawning
execute if score #global wave.spawn_delay_timer matches 1.. run scoreboard players remove #global wave.spawn_delay_timer 1
execute if score #global wave.spawn_delay_timer matches 1.. run return 0

# Timer expired - spawn one dog per active player
scoreboard players operation #dog_spawned_before temp = #global wave.spawned
execute as @a[team=!downed] at @s run function zbk:waves/spawning/dog/spawn_per_player

# Set delay timer only after at least one dog actually spawned.
execute if score #global wave.spawned > #dog_spawned_before temp run scoreboard players set #global wave.spawn_delay_timer 60
