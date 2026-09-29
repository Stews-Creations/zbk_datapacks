# ===================================
# CAPTURE SINGLE PLAYER NAME
# ===================================
# Runs as each adventure mode player
# Extracts their username and stores it in zbk:stats storage

# Capture without replacing or clearing any real inventory item.
execute at @s run function zbk:player/utils/capture_profile
execute unless data storage zbk:player_profile current.name run return 0
scoreboard players add #stats_player_count stats 1
data modify storage zbk:stats current_name set from storage zbk:player_profile current.name

# Store name based on player index
execute if score #stats_player_count stats matches 1 run data modify storage zbk:stats players.p1 set from storage zbk:stats current_name
execute if score #stats_player_count stats matches 2 run data modify storage zbk:stats players.p2 set from storage zbk:stats current_name
execute if score #stats_player_count stats matches 3 run data modify storage zbk:stats players.p3 set from storage zbk:stats current_name
execute if score #stats_player_count stats matches 4 run data modify storage zbk:stats players.p4 set from storage zbk:stats current_name
