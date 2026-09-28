# ===================================
# CAPTURE SINGLE PLAYER NAME
# ===================================
# Runs as each adventure mode player
# Extracts their username and stores it in zombies:stats storage

# Capture without replacing or clearing any real inventory item.
execute at @s run function zombies:player/utils/capture_profile
execute unless data storage zombies:player_profile current.name run return 0
scoreboard players add #stats_player_count stats 1
data modify storage zombies:stats current_name set from storage zombies:player_profile current.name

# Store name based on player index
execute if score #stats_player_count stats matches 1 run data modify storage zombies:stats players.p1 set from storage zombies:stats current_name
execute if score #stats_player_count stats matches 2 run data modify storage zombies:stats players.p2 set from storage zombies:stats current_name
execute if score #stats_player_count stats matches 3 run data modify storage zombies:stats players.p3 set from storage zombies:stats current_name
execute if score #stats_player_count stats matches 4 run data modify storage zombies:stats players.p4 set from storage zombies:stats current_name
