# === RESPAWN DEAD PLAYERS ===
# Called at round end - respawns spectators (dead players) at spawn points
# Important: Set gamemode BEFORE teleporting to stop spectating
# Uses round-robin distribution across all spawn point markers

# Check if spawn point marker exists
execute unless entity @e[type=marker,tag=spawn_point_marker,limit=1] run return 0

# Tag spectators before converting them (so we can track who was dead)
tag @a[gamemode=spectator] add just_respawned

# Set spectators back to adventure mode first (stops spectating)
gamemode adventure @a[gamemode=spectator]

# Tag respawned players for spawn distribution
tag @a[tag=just_respawned] add spawn_pending

# Distribute respawned players across spawn points using round-robin
function zombies:game/management/spawn_point/distribute_players

# Reset down system for respawned players
execute as @a[tag=just_respawned] run function zombies:player/down_system/reset

# Give starting inventory (knife) - use wrapper to include knife damage
execute as @a[tag=just_respawned] run function zombies:player/inventory/give_knife_wrapper

execute as @a[tag=just_respawned,tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[Game] ","color":"gold"},{"text":"You have been respawned!","color":"green"}]

execute as @a[tag=just_respawned] at @s run function zbk:dispatch/player_respawned

# Remove temporary tag
tag @a[tag=just_respawned] remove just_respawned
