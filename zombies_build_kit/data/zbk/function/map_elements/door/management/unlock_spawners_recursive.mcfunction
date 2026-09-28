# === UNLOCK SPAWNERS RECURSIVE ===
# Processes each zone in the unlock_zones array
# Unlocks all spawners that have that zone number

# Check if we have any zones left to process
execute unless data storage zbk:temp unlock_zones[0] run return 0

# Get the zone number from the first element and store in scoreboard
execute store result score #zone_to_unlock global run data get storage zbk:temp unlock_zones[0]

# Unlock all zombie spawners with this zone
# Store each spawner's zone, then compare and unlock
execute as @e[type=marker,tag=zombie_spawner] run function zbk:map_elements/door/management/check_and_unlock_spawner

# Unlock all dog spawners with this zone
execute as @e[type=marker,tag=dog_spawner] run function zbk:map_elements/door/management/check_and_unlock_spawner

function zbk:dispatch/extension/map_elements/door/management/unlock_spawners_recursive/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# Fire zone_unlocked signals for this zone
function zbk:map_elements/game_signals/runtime/fire_zone_unlocked
execute store result storage zbk:state zone_args.zone int 1 run scoreboard players get #zone_to_unlock global
function zbk:zones/notify with storage zbk:state zone_args

# Feedback message (debug only)
execute if score #zone_to_unlock global matches 0 as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[ZONES] ","color":"yellow"},{"text":"Zone 0 unlocked (was already unlocked)","color":"gray"}]
execute if score #zone_to_unlock global matches 1.. as @a[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[ZONES] ","color":"yellow"},{"text":"Zone ","color":"green"},{"score":{"name":"#zone_to_unlock","objective":"global"},"color":"aqua","bold":true},{"text":" unlocked!","color":"green"}]

# Remove this zone from the list and recurse
data remove storage zbk:temp unlock_zones[0]
function zbk:map_elements/door/management/unlock_spawners_recursive
