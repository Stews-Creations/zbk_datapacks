# === SUMMON PLAYER BLOCK MARKER ===
# Summons a player_block marker at the player's position
# Used with player_area_block.mcfunction to teleport players when they step on light[level=5]

# Summon the player_block marker at the player's position
execute as @p at @s run summon marker ~ ~ ~ {Tags:["player_block"]}

# Feedback to player
tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Player Block marker placed at your location","color":"green"}]
