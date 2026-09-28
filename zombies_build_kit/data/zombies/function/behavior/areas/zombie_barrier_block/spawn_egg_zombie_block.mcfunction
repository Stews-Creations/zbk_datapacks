# === GIVE ZOMBIE BLOCK MARKER SPAWN EGG ===
# Purpose: Give the player a zombie block marker placement item
# This creates markers where zombies/players will teleport to when blocked by light level 6

give @s minecraft:creeper_spawn_egg[custom_name=[{"text":"Zombie Block Marker","italic":false,"color":"red"}],custom_data={zombie_block_marker:1b}] 1
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Barriers] ","color":"gold"},{"text":"Received Zombie Block Marker","color":"green"}]
