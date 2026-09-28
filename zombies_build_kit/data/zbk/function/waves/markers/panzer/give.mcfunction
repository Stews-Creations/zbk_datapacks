# === GIVE PANZER SPAWN MARKER ===
# Purpose: Give player a spawn egg that places a Panzer spawn marker

give @s minecraft:llama_spawn_egg[custom_name={"text":"Panzer Spawn Marker","italic":false,"color":"gold"},custom_data={panzer_spawn_marker:1b}] 1
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Waves] ","color":"gold"},{"text":"Received Panzer Spawn Marker","color":"gold"}]
