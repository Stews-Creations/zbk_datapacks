# === GIVE LIGHT LEVEL 6 BLOCK ===
# Purpose: Give the player a light level 6 block for zombie+player blocking
# Light level 6 blocks zombies and players, teleports them to nearest barrier_zombie_block marker

give @s minecraft:light[block_state={level:"6"}] 64
tellraw @s [{"text":"[Barriers] ","color":"gold"},{"text":"Received Light Level 6 blocks (Zombie + Player Block)","color":"red"}]
