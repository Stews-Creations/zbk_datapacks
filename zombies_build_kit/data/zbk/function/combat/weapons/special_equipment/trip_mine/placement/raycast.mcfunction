# ===================================
# TRIP MINE PLACEMENT RAYCAST
# ===================================
# Executor: player
# Position: current ray sample

execute if score #trip_mine_placed temp matches 1 run return 1

# Slabs and stairs are valid mine surfaces even when the shared raycast pass tag treats them as pass-through.
execute if block ~ ~ ~ #minecraft:slabs if block ~ ~1 ~ #zbk:raycast_pass align xyz positioned ~0.5 ~0.45 ~0.5 run function zbk:combat/weapons/special_equipment/trip_mine/placement/spawn_marker
execute if score #trip_mine_placed temp matches 1 run return 1
execute if block ~ ~ ~ #minecraft:slabs run return 0

execute if block ~ ~ ~ #minecraft:stairs if block ~ ~1 ~ #zbk:raycast_pass align xyz positioned ~0.5 ~0.45 ~0.5 run function zbk:combat/weapons/special_equipment/trip_mine/placement/spawn_marker
execute if score #trip_mine_placed temp matches 1 run return 1
execute if block ~ ~ ~ #minecraft:stairs run return 0

execute unless block ~ ~ ~ #zbk:raycast_pass if block ~ ~1 ~ #zbk:raycast_pass align xyz positioned ~0.5 ~0.95 ~0.5 run function zbk:combat/weapons/special_equipment/trip_mine/placement/spawn_marker
execute unless block ~ ~ ~ #zbk:raycast_pass run return 0

scoreboard players add @s raycast_distance 1
execute if score @s raycast_distance matches ..60 positioned ^ ^ ^0.1 run function zbk:combat/weapons/special_equipment/trip_mine/placement/raycast
