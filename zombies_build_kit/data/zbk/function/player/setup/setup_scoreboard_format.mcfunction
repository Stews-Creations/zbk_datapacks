# ===================================
# SETUP SCOREBOARD FORMAT (fixed)
# ===================================

# Clear old display formatting
scoreboard players display name @s player_points
scoreboard players display numberformat @s player_points

# Extract the profile without putting a temporary head into the hotbar.
execute at @s run function zbk:player/utils/capture_profile
execute unless data storage zbk:player_profile current.name run return 0
data modify storage temp:player_head player_name set from storage zbk:player_profile current.name

# Apply head and username in both solo and multiplayer
function zbk:player/utils/player_head with storage temp:player_head

# Set custom number format (styled updates dynamically)
scoreboard players display numberformat @s player_points
