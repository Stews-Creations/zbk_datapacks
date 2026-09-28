# === GIVE ZOMBIE SPAWN MARKER ===
# Purpose: Give the player a zombie spawn marker placement item
# This creates persistent spawn points where zombies will spawn during waves

give @s minecraft:axolotl_spawn_egg[custom_name={"text":"Zombie Spawn Marker","italic":false,"color":"green"},custom_data={zombie_spawn_marker:1b}] 1
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Waves] ","color":"gold"},{"text":"Received Zombie Spawn Marker","color":"green"}]
