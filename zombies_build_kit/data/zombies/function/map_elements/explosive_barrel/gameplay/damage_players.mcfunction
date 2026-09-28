# ===================================
# EXPLOSIVE BARREL - DAMAGE PLAYER
# ===================================
# Purpose: Apply flat 5 hearts (10 HP) damage to a player in barrel explosion radius
# Called as @s = the player, at @s = player position

# Skip downed players
execute if entity @s[team=downed] run return 0

# Apply 10 HP (5 hearts) flat damage
damage @s 10 minecraft:generic
