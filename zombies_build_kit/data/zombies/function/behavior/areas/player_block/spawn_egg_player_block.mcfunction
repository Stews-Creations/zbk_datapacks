# === GIVE PLAYER BLOCK MARKER SPAWN EGG ===
# Purpose: Give the player a player block marker placement item
# This creates markers where players will teleport to when blocked by light level 5

give @s minecraft:cat_spawn_egg[custom_name=[{"text":"Player Block Marker","italic":false,"color":"aqua"}],custom_data={player_block_marker:1b}] 1
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Barriers] ","color":"gold"},{"text":"Received Player Block Marker","color":"green"}]
