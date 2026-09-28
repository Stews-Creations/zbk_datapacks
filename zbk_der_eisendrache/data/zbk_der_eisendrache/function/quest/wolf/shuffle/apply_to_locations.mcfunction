# Apply shuffled array to painting locations
# Reads current array and assigns paintings to the 4 selected locations

# Read the shuffled array values and assign to location scores
execute store result score @e[type=marker,tag=wolf_selected,limit=1,sort=arbitrary] wolf_random run data get storage zombies:wolf_shuffle current[0]
tag @e[type=marker,tag=wolf_selected,limit=1,sort=arbitrary] add wolf_assigned_0
tag @e[type=marker,tag=wolf_selected,tag=wolf_assigned_0] remove wolf_selected

execute store result score @e[type=marker,tag=wolf_selected,limit=1,sort=arbitrary] wolf_random run data get storage zombies:wolf_shuffle current[1]
tag @e[type=marker,tag=wolf_selected,limit=1,sort=arbitrary] add wolf_assigned_1
tag @e[type=marker,tag=wolf_selected,tag=wolf_assigned_1] remove wolf_selected

execute store result score @e[type=marker,tag=wolf_selected,limit=1,sort=arbitrary] wolf_random run data get storage zombies:wolf_shuffle current[2]
tag @e[type=marker,tag=wolf_selected,limit=1,sort=arbitrary] add wolf_assigned_2
tag @e[type=marker,tag=wolf_selected,tag=wolf_assigned_2] remove wolf_selected

execute store result score @e[type=marker,tag=wolf_selected,limit=1,sort=arbitrary] wolf_random run data get storage zombies:wolf_shuffle current[3]
tag @e[type=marker,tag=wolf_selected,limit=1,sort=arbitrary] add wolf_assigned_3

# Clean up temporary tags
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_assigned_0
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_assigned_1
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_assigned_2
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_assigned_3
