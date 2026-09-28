# === GIVE LIGHT LEVEL 5 BLOCK ===
# Purpose: Give the player a light level 5 block for player-only blocking
# Light level 5 blocks players and teleports them to nearest player_block marker

give @s minecraft:light[block_state={level:"5"}] 64
tellraw @s [{"text":"[Barriers] ","color":"gold"},{"text":"Received Light Level 5 blocks (Player Block)","color":"aqua"}]
