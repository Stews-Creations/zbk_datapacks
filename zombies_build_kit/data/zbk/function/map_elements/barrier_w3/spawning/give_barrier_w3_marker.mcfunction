# === GIVE WIDE BARRIER MARKER ===
# Purpose: Give the player a wide barrier placement marker item

give @s minecraft:silverfish_spawn_egg[custom_name=[{"text":"Barrier Marker (3-Wide)","italic":false,"color":"yellow"}],custom_data={barrier_w3_marker:1b}] 1
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Barrier W3] ","color":"gold"},{"text":"Received Barrier Marker (3-Wide)","color":"yellow"}]
