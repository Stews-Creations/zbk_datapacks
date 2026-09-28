# ===================================
# CAPTURE PLAYER NAMES FOR STATS
# ===================================
# Iterates all adventure mode players and stores their names
# in zombies:stats storage for use in dialog macros

# Reset player count
scoreboard players set #stats_player_count stats 0

# Clear previous names
data remove storage zombies:stats players
data modify storage zombies:stats players set value {p1:"",p2:"",p3:"",p4:""}

# Capture each player's name
execute as @a[gamemode=adventure] run function zombies:player/stats/capture_player_name
