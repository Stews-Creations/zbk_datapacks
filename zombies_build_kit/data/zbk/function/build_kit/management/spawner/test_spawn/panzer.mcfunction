# === TEST SPAWN PANZER ===
# Runs as and at a Panzer spawner marker. Uses the existing delayed Panzer spawn flow.

tag @s add panzer_spawn_selected
function zbk:bosses/panzer/spawn/pending/start_from_marker

tellraw @a[tag=debug,scores={debug_level=4..}] [{"text":"[Build Manager] ","color":"gold"},{"text":"Test queued one Panzer spawn.","color":"green"}]
