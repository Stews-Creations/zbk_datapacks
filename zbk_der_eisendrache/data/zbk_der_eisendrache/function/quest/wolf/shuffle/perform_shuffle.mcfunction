# Perform one shuffle iteration
# Resets array to [1,2,3,4] and performs Durstenfeld shuffle

# Reset array to original
data modify storage zombies:wolf_shuffle current set value [1,2,3,4]

# Durstenfeld shuffle: iterate backwards from i=3 to i=1
# For each i, swap with random j from 0 to i

# Iteration 1: i=3, j can be 0-3
execute store result score #j wolf_painting_temp run random value 0..3
execute store result storage zombies:wolf_shuffle swap.i int 1 run scoreboard players set #i wolf_painting_temp 3
execute store result storage zombies:wolf_shuffle swap.j int 1 run scoreboard players get #j wolf_painting_temp
function zbk_der_eisendrache:quest/wolf/shuffle/swap_macro with storage zombies:wolf_shuffle swap

# Iteration 2: i=2, j can be 0-2
execute store result score #j wolf_painting_temp run random value 0..2
execute store result storage zombies:wolf_shuffle swap.i int 1 run scoreboard players set #i wolf_painting_temp 2
execute store result storage zombies:wolf_shuffle swap.j int 1 run scoreboard players get #j wolf_painting_temp
function zbk_der_eisendrache:quest/wolf/shuffle/swap_macro with storage zombies:wolf_shuffle swap

# Iteration 3: i=1, j can be 0-1
execute store result score #j wolf_painting_temp run random value 0..1
execute store result storage zombies:wolf_shuffle swap.i int 1 run scoreboard players set #i wolf_painting_temp 1
execute store result storage zombies:wolf_shuffle swap.j int 1 run scoreboard players get #j wolf_painting_temp
function zbk_der_eisendrache:quest/wolf/shuffle/swap_macro with storage zombies:wolf_shuffle swap

# Validate the shuffle
function zbk_der_eisendrache:quest/wolf/shuffle/validate

# If validation failed and attempts < 10, try again
execute if score #shuffle_valid wolf_painting_temp matches 0 if score #shuffle_attempts wolf_painting_temp matches ..9 run scoreboard players add #shuffle_attempts wolf_painting_temp 1
execute if score #shuffle_valid wolf_painting_temp matches 0 if score #shuffle_attempts wolf_painting_temp matches ..9 run function zbk_der_eisendrache:quest/wolf/shuffle/perform_shuffle
