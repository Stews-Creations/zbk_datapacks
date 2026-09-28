# Validate that shuffled array doesn't match previous at any index
# Sets #shuffle_valid to 1 if valid (all different), 0 if invalid (any match)

# Start by assuming valid
scoreboard players set #shuffle_valid wolf_painting_temp 1

# Check each index - if current[i] == previous[i], mark as invalid
execute store result score #current_0 wolf_painting_temp run data get storage zombies:wolf_shuffle current[0]
execute store result score #previous_0 wolf_painting_temp run data get storage zombies:wolf_shuffle previous[0]
execute if score #current_0 wolf_painting_temp = #previous_0 wolf_painting_temp run scoreboard players set #shuffle_valid wolf_painting_temp 0

execute store result score #current_1 wolf_painting_temp run data get storage zombies:wolf_shuffle current[1]
execute store result score #previous_1 wolf_painting_temp run data get storage zombies:wolf_shuffle previous[1]
execute if score #current_1 wolf_painting_temp = #previous_1 wolf_painting_temp run scoreboard players set #shuffle_valid wolf_painting_temp 0

execute store result score #current_2 wolf_painting_temp run data get storage zombies:wolf_shuffle current[2]
execute store result score #previous_2 wolf_painting_temp run data get storage zombies:wolf_shuffle previous[2]
execute if score #current_2 wolf_painting_temp = #previous_2 wolf_painting_temp run scoreboard players set #shuffle_valid wolf_painting_temp 0

execute store result score #current_3 wolf_painting_temp run data get storage zombies:wolf_shuffle current[3]
execute store result score #previous_3 wolf_painting_temp run data get storage zombies:wolf_shuffle previous[3]
execute if score #current_3 wolf_painting_temp = #previous_3 wolf_painting_temp run scoreboard players set #shuffle_valid wolf_painting_temp 0
