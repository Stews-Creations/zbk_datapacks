# === CHECK ROUND COMPLETE ===
# Purpose: Check if all enemies are spawned AND eliminated
# Called every tick during state 3 (all spawned, waiting for kills)

# Count remaining wave enemies
execute store result score #temp temp if entity @e[tag=wave_enemy]

# Only end round if ALL enemies spawned AND all enemies dead
execute if score #global wave.spawned >= #global wave.spawn_count if score #temp temp matches 0 unless entity @e[tag=zbk.round_blocker] run function zombies:waves/management/rounds/end_round
