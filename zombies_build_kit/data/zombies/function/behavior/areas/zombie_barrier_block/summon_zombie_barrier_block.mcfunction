# === SUMMON ZOMBIE BARRIER BLOCK MARKER ===
# Summons a barrier_zombie_block marker at the player's position
# Used with zombie_barrier_block.mcfunction to teleport zombified piglins when they step on light[level=6]

# Summon the barrier_zombie_block marker at the player's position
execute as @p at @s run summon marker ~ ~ ~ {Tags:["barrier_zombie_block"]}

# Feedback to player
tellraw @a [{"text":"[Build Manager] ","color":"gold"},{"text":"Zombie Barrier Block marker placed at your location","color":"green"}]
