# === ZOMBIE BARRIER BLOCK ===
# Teleports players and zombified piglins when they step on light[level=6]
# Players teleport to player_block markers
# Zombified piglins teleport to barrier_zombie_block markers

# Teleport players to player_block marker
execute as @a[tag=!disable_tp] at @s if block ~ ~ ~ minecraft:light[level=6] positioned as @e[type=marker,tag=player_block,sort=nearest,limit=1] run tp @s ~ ~ ~ ~ ~

# Teleport zombified piglins to barrier_zombie_block marker
execute as @e[type=zombified_piglin] at @s if block ~ ~ ~ minecraft:light[level=6] positioned as @e[type=marker,tag=barrier_zombie_block,sort=nearest,limit=1] run tp @s ~ ~ ~ ~ ~
