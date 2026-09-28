# === EXECUTE TAG SPAWN LOCATION ===
# Runs as the nearest mystery box location marker
# Tags this location as a spawn location

# Check if already tagged
execute if score @s mystery_box_spawn_location matches 1 as @a[distance=..5,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Mystery Box] ","color":"aqua"},{"text":"This location is already tagged as a spawn location!","color":"yellow"}]
execute if score @s mystery_box_spawn_location matches 1 run return 0

# Tag this location as a spawn location
scoreboard players set @s mystery_box_spawn_location 1

# Provide feedback
execute as @a[distance=..5,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Mystery Box] ","color":"aqua"},{"text":"Location ID ","color":"green"},{"score":{"name":"@s","objective":"mystery_box_location_id"},"color":"gold"},{"text":" tagged as spawn location!","color":"green"}]
