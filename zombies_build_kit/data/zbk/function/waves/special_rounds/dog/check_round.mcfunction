# === CHECK DOG ROUND ===
# Purpose: Determine if current round is a dog round
# Uses the configured first dog round and repeat interval.

execute unless score #global wave.dog_start_round matches 1.. run scoreboard players set #global wave.dog_start_round 5
execute unless score #global wave.dog_round_interval matches 1.. run scoreboard players set #global wave.dog_round_interval 5
execute if score #global wave.round < #global wave.dog_start_round run return 0

scoreboard players operation #dog_round_mod temp = #global wave.round
scoreboard players operation #dog_round_mod temp -= #global wave.dog_start_round
scoreboard players operation #dog_round_mod temp %= #global wave.dog_round_interval

execute if score #dog_round_mod temp matches 0 run function zbk:waves/special_rounds/dog/set_round
