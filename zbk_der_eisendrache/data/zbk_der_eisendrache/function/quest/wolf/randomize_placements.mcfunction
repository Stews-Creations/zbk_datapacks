# Randomize wolf painting placements using Fisher-Yates (Durstenfeld) shuffle
# Uses data storage arrays with macro-based swapping
# Ensures no painting returns to its previous location

# Select 4 random spawn locations
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_selected
execute as @e[type=marker,tag=wolf_spawn_location,sort=random,limit=4] run tag @s add wolf_selected

# Perform Fisher-Yates shuffle with validation
function zbk_der_eisendrache:quest/wolf/shuffle/fisher_yates

# Apply shuffled array to selected locations
function zbk_der_eisendrache:quest/wolf/shuffle/apply_to_locations

# Teleport paintings to their assigned locations
execute as @e[type=marker,tag=wolf_painting_1] at @e[type=marker,tag=wolf_spawn_location,scores={wolf_random=1},limit=1] run tp @s ~ ~ ~
execute as @e[type=marker,tag=wolf_painting_2] at @e[type=marker,tag=wolf_spawn_location,scores={wolf_random=2},limit=1] run tp @s ~ ~ ~
execute as @e[type=marker,tag=wolf_painting_3] at @e[type=marker,tag=wolf_spawn_location,scores={wolf_random=3},limit=1] run tp @s ~ ~ ~
execute as @e[type=marker,tag=wolf_painting_4] at @e[type=marker,tag=wolf_spawn_location,scores={wolf_random=4},limit=1] run tp @s ~ ~ ~

tellraw @a[tag=debug] [{"text":"Wolf paintings randomized","color":"green"}]

# Copy current scores to wolf_prev_config for next reload (not used with storage, but kept for compatibility)
execute as @e[type=marker,tag=wolf_spawn_location] run scoreboard players operation @s wolf_prev_config = @s wolf_random

# Remove old structures from all spawn locations before placing new ones
function zbk_der_eisendrache:quest/wolf/spawning/remove_structures

# Place new structures immediately
# Note: May produce cosmetic "Block-attached entity at invalid position" errors in logs
# This is a Minecraft limitation with structure templates containing item frames
function zbk_der_eisendrache:quest/wolf/spawning/place_structures_delayed

# Clean up temporary tags
tag @e[type=marker,tag=wolf_spawn_location] remove wolf_selected
