# Selects an open Panzer spawn marker near the closest active player, then starts the delayed spawn.
# If no active adventure player can be scored, marker selection falls back to any open marker.
# Falls back to the execution position only when no Panzer spawn markers exist yet.

scoreboard players set #panzer_spawn_used_marker temp 0
tag @e[type=minecraft:marker,tag=panzer_spawn_selected] remove panzer_spawn_selected

execute if entity @e[type=minecraft:marker,tag=panzer_spawner] run function zbk:bosses/panzer/spawn/selection/select_marker

execute if entity @e[type=minecraft:marker,tag=panzer_spawn_selected,limit=1] as @e[type=minecraft:marker,tag=panzer_spawn_selected,limit=1] at @s run function zbk:bosses/panzer/spawn/pending/start_from_marker
execute if score #panzer_spawn_used_marker temp matches 1 run return 1

execute unless entity @e[type=minecraft:marker,tag=panzer_spawner] run function zbk:bosses/panzer/spawn/pending/start_here
