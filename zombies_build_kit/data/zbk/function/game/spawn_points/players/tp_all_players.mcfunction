# === TELEPORT ALL PLAYERS TO SPAWN POINTS ===
# Called when game starts - distributes players across spawn point markers (round-robin)
# With 2 markers and 4 players: 2 players at each marker

# Check if spawn point marker exists - ERROR MESSAGE (keep visible to all players)
execute unless entity @e[type=marker,tag=spawn_point_marker,limit=1] run tellraw @a [{"text":"[Game] ","color":"gold"},{"text":"Warning: No spawn point set!","color":"red"}]
execute unless entity @e[type=marker,tag=spawn_point_marker,limit=1] run return 0

# Tag all adventure mode players for spawn distribution
tag @a[gamemode=adventure] add spawn_pending

# Distribute players across spawn points using round-robin
function zbk:game/spawn_points/players/distribute_players

function zbk:debug/info {f:"GAME",m:"Players distributed to spawn points"}
