# === GIVE BARRIER MARKER ===
# Purpose: Give the player a barrier placement marker item
# This creates persistent barriers that zombies can break and players can repair

give @s minecraft:silverfish_spawn_egg[custom_name=[{"text":"Barrier Marker","italic":false,"color":"yellow"}],custom_data={barrier_marker:1b}] 1
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Barrier] ","color":"gold"},{"text":"Received Barrier Marker","color":"yellow"}]
