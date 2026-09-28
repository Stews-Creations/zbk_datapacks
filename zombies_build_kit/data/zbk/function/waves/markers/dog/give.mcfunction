# === GIVE DOG SPAWN MARKER ===
# Purpose: Give the player a dog spawn marker placement item
# This creates persistent spawn points where dogs will spawn during dog rounds

give @s minecraft:wolf_spawn_egg[custom_name={"text":"Dog Spawn Marker","italic":false,"color":"red"},custom_data={dog_spawn_marker:1b}] 1
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Waves] ","color":"gold"},{"text":"Received Dog Spawn Marker","color":"red"}]
